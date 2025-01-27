<?php

class BeaconStripeAPI {
	private $api_secret = '';
	private $stripe_version = '';
	
	public function __construct(string $api_secret, string $stripe_version = '2020-08-27') {
		$this->api_secret = $api_secret;
		$this->stripe_version = $stripe_version;
	}
	
	protected function GetURL(string $url): ?array {
		$json = BeaconCache::Get($url);
		if (is_null($json) === false) {
			return $json;
		}
		
		$curl = curl_init($url);
		$headers = [
			'Authorization: Bearer ' . $this->api_secret,
			'Stripe-Version: ' . $this->stripe_version
		];
		curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$body = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);
		
		if ($status != 200) {
			return null;
		}
		$json = json_decode($body, true);
		if (is_null($json)) {
			return null;
		}
		
		BeaconCache::Set($url, $json, 300);
		return $json;
	}
	
	protected function PostURL(string $url, array $formdata): ?array {
		$curl = curl_init($url);
		$headers = [
			'Authorization: Bearer ' . $this->api_secret,
			'Stripe-Version: ' . $this->stripe_version
		];
		curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($formdata));
		$body = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);
		
		if ($status === 200) {
			return json_decode($body, true);
		} else {
			return null;
		}
	}
	
	protected function DeleteURL(string $url): ?array {
		$curl = curl_init($url);
		$headers = [
			'Authorization: Bearer ' . $this->api_secret,
			'Stripe-Version: ' . $this->stripe_version
		];
		curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'DELETE');
		$body = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);
		
		if ($status === 200) {
			return json_decode($body, true);
		} else {
			return null;
		}
	}
	
	public function GetPaymentIntent(string $intent_id): ?array {
		return $this->GetURL('https://api.stripe.com/v1/payment_intents/' . $intent_id);
	}
	
	public function GetLineItems(string $session_id): ?array {
		return $this->GetURL('https://api.stripe.com/v1/checkout/sessions/' . $session_id . '/line_items?expand%5B%5D=data.discounts&expand%5B%5D=data.taxes');
	}
	
	public function GetCustomer(string $customer_id): ?array {
		return $this->GetURL('https://api.stripe.com/v1/customers/' . $customer_id);
	}
	
	public function GetCustomersByEmail(string $customer_email): ?array {
		return $this->GetURL('https://api.stripe.com/v1/customers/search?query=' . urlencode("email:'{$customer_email}'"));
	}
	
	public function GetProductByUUID(string $product_id): ?array {
		$results = $this->GetURL('https://api.stripe.com/v1/products/search?query=' . urlencode("metadata['beacon-uuid']:'{$product_id}'"));
		if (count($results['data']) > 0) {
			return $results['data'][0];
		} else {
			return null;
		}
	}
	
	public function GetProductPrices(string $product_code, ?string $currency = null): ?array {
		$query = "product:'{$product_code}'";
		if (is_null($currency) === false) {
			$query .= " AND currency:'{$currency}'";
		}
		$results = $this->GetURL('https://api.stripe.com/v1/prices/search?query=' . urlencode($query) . '&limit=100');
		if ($results['has_more'] == true) {
			echo "Partial results\n";
		}
		return $results['data'];
	}
	
	public function GetBillingLocality(string $intent_id): ?string {
		$intent = $this->GetPaymentIntent($intent_id);
		if (is_null($intent)) {
			return null;
		}
		
		$charges = $intent['charges']['data'];
		if (is_array($charges) == false || count($charges) == 0) {
			return null;
		}
		
		$charge = $charges[0];
		
		if (array_key_exists('billing_details', $charge) == false) {
			return null;
		}
		$billing = $charge['billing_details'];
		
		if (array_key_exists('address', $billing) == false) {
			return null;
		}
		
		$address = $billing['address'];
		if (array_key_exists('country', $address) == false || is_null($address['country'])) {
			return null;
		}
		
		if (array_key_exists('state', $address) == false || is_null($address['state'])) {
			return $address['country'];
		} else {
			return $address['country'] . ' ' . $address['state'];
		}
	}
			
	
	public function UpdateCustomer(string $customer_id, array $fields): bool {
		$customer = $this->PostURL('https://api.stripe.com/v1/customers/' . $customer_id, $fields);
		return (is_null($customer) === false);
	}
	
	public function EmailForPaymentIntent(string $intent_id): ?string {
		$cache_key = 'email_' . $intent_id;
		$email = BeaconCache::Get($cache_key);
		if (!is_null($email)) {
			return $email;
		}
		
		$pi_json = $this->GetPaymentIntent($intent_id);
		if (is_null($pi_json)) {
			return null;
		}
		if (array_key_exists('customer', $pi_json) == false || empty($pi_json['customer'])) {
			return null;
		}
		
		$customer_id = $pi_json['customer'];
		$customer_json = $this->GetCustomer($customer_id);
		if (is_null($customer_json)) {
			return null;
		}
		
		$email = $customer_json['email'];
		BeaconCache::Set($cache_key, $email, 3600);
		return $email;
	}
	
	public function ChangeEmailForPaymentIntent(string $intent_id, string $new_email): bool {
		$cache_key = 'email_' . $intent_id;
		
		$pi_json = $this->GetPaymentIntent($intent_id);
		if (is_null($pi_json)) {
			return false;
		}
		
		if (array_key_exists('customer', $pi_json) == false || empty($pi_json['customer'])) {
			return false;
		}
		
		$customer_id = $pi_json['customer'];
		$customer_json = $this->GetCustomer($customer_id);
		if (is_null($customer_json)) {
			return false;
		}
		
		if (strtolower($customer_json['email']) == strtolower($new_email)) {
			return true;
		}
		
		if (!$this->UpdateCustomer($customer_id, ['email' => $new_email])) {
			return false;
		}
		
		BeaconCache::Set($cache_key, $new_email, 3600);
		return true;
	}
	
	public function CreateCheckoutSession(array $details): ?array {
		return $this->PostURL('https://api.stripe.com/v1/checkout/sessions', $details);
	}
	
	public function GetCountrySpec(string $country_code): ?array {
		return $this->GetURL('https://api.stripe.com/v1/country_specs/' . $country_code);
	}
	
	public function UpdatedProductPrice(string $price_id, int $amount): string|bool {
		$response = $this->GetURL('https://api.stripe.com/v1/prices/' . $price_id);
		if (is_null($response)) {
			return false;
		}
		
		$new_price_id = null;
		$product_id = $response['product'];
		$currency = $response['currency'];
		$old_amount = $response['unit_amount'];
		if ($old_amount === $amount) {
			return $price_id;
		}
		
		// See if there is already an archived price
		$response = $this->GetURL('https://api.stripe.com/v1/prices/search?query=' . urlencode("product:'$product_id' AND currency:'$currency'"));
		if (is_null($response)) {
			return false;
		}
		$results = $response['data'];
		foreach ($results as $price) {
			if ($price['unit_amount'] != $amount) {
				continue;
			}
			
			$new_price_id = $price['id'];
			if ($price['active'] == false) {
				// Need to reactivate the price
				$response = $this->PostURL('https://api.stripe.com/v1/prices/' . $new_price_id, ['active' => 'true']);
				if (is_null($response)) {
					return false;
				}
			}
			
			break;
		}
		
		if (is_null($new_price_id)) {
			$response = $this->PostURL('https://api.stripe.com/v1/prices', [
				'unit_amount' => $amount,
				'currency' => $currency,
				'product' => $product_id,
				'tax_behavior' => 'exclusive'
			]);
			
			if (is_null($response)) {
				return false;
			}
			
			$new_price_id = $response['id'];
		}
		
		// Deactivate the old price
		$response = $this->PostURL('https://api.stripe.com/v1/prices/' . $price_id, ['active' => 'false']);
		
		return $new_price_id;
	}
	
	public function CreatePrice(string $product_code, string $currency, int $amount): string|bool {
		$response = $this->PostURL('https://api.stripe.com/v1/prices', [
			'unit_amount' => $amount,
			'currency' => $currency,
			'product' => $product_code,
			'tax_behavior' => 'exclusive'
		]);
		
		if (is_null($response)) {
			return false;
		}
		
		return $response['id'];
	}
	
	public function EditPrice(string $price_id, array $changes): ?array {
		return $this->PostURL('https://api.stripe.com/v1/prices/' . $price_id, $changes);
	}
	
	public function EditProduct(string $product_code, array $changes): ?array {
		return $this->PostURL('https://api.stripe.com/v1/products/' . $product_code, $changes);
	}
}

?>