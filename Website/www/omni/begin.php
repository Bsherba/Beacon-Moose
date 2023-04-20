<?php

header('Content-Type: application/json');
header('Cache-Control: no-cache, no-store, must-revalidate');
header('Pragma: no-cache');
header('Expires: 0');
http_response_code(500);

require(dirname(__FILE__, 3) . '/framework/loader.php');

BeaconCommon::StartSession();

if (strtoupper($_SERVER['REQUEST_METHOD']) !== 'POST') {
	http_response_code(405);
	echo json_encode(['error' => true, 'message' => 'Method not allowed.'], JSON_PRETTY_PRINT);
	exit;
}

if ($_SERVER['HTTP_CONTENT_TYPE'] !== 'application/json') {
	http_response_code(400);
	echo json_encode(['error' => true, 'message' => 'This endpoint expects a JSON body.'], JSON_PRETTY_PRINT);
	exit;
}

$cart = json_decode(file_get_contents('php://input'), true);
if ($cart === false) {
	http_response_code(400);
	echo json_encode(['error' => true, 'message' => 'There was a JSON parse error.'], JSON_PRETTY_PRINT);
	exit;
}

$email = strtolower(trim($cart['email']));
$bundles = $cart['items'];
$currency = $_SESSION['store_currency'];

if (count($bundles) === 0) {
	http_response_code(400);
	echo json_encode(['error' => true, 'message' => 'The cart is empty.'], JSON_PRETTY_PRINT);
	exit;
}

$database = BeaconCommon::Database();
if (isset($_COOKIE['beacon_affiliate'])) {
	$client_reference_id = $_COOKIE['beacon_affiliate'];
	
	
	$rows = $database->Query('SELECT purchase_id, code FROM affiliate_tracking WHERE client_reference_id = $1;', $client_reference_id);
	if ($rows->RecordCount() === 1 && is_null($rows->Field('purchase_id')) === false) {
		// need a new id
		$client_reference_id = BeaconShop::TrackAffiliateClick($rows->Field('code'));
	}
} else {
	$client_reference_id = BeaconCommon::GenerateUUID();
}
$payment = [
	'client_reference_id' => $client_reference_id,
	'customer_email' => $email,
	'payment_method_types' => [
		'card',
		'ideal',
		'giropay',
		'bancontact',
		'p24',
		'eps'
	],
	'mode' => 'payment',
	'success_url' => BeaconCommon::AbsoluteURL('/omni/welcome/'),
	'cancel_url' => BeaconCommon::AbsoluteURL('/omni/#checkout'),
	'billing_address_collection' => 'required',
	'automatic_tax' => ['enabled' => 'true'],
	'line_items' => [],
];

$user = null;
$licenses = [];
try {
	$user = BeaconUser::GetByEmail($email);
	if (is_null($user) === false) {
		$payment['metadata']['Beacon User UUID'] = $user->UserID();
		$licenses = $user->Licenses();
	}
} catch (Exception $err) {
}

try {
	if (is_null($user)) {
		$url = 'https://api.cleantalk.org/?method_name=email_check&auth_key=' . urlencode(BeaconCommon::GetGlobal('CleanTalk Email Check Key')) . '&email=' . urlencode($email);
		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$body = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		if ($status === 200) {
			$parsed = json_decode($body, TRUE);
			$data = $parsed['data'];
			$result = $data[$email]['result'];
			switch ($result) {
			case 'NOT_EXISTS':
			case 'MX_FAIL':
			case 'MX_FAIL':
				// Confirmed failure
				http_response_code(400);
				echo json_encode(['error' => true, 'message' => 'We were unable to verify that your email address exists. This is probably due to a typo, but if we are wrong, create an account to skip this check.'], JSON_PRETTY_PRINT);
				exit;
			}
		}
	}
} catch (Exception $err) {
}

$api = new BeaconStripeAPI(BeaconCommon::GetGlobal('Stripe_Secret_Key'));
try {
	$customers = $api->GetCustomersByEmail($email);
	if (is_null($customers) === false && is_array($customers) && array_key_exists('data', $customers) && count($customers['data']) >= 1) {
		$customer = $customers['data'][0];
		$payment['customer'] = $customer['id'];
		$payment['customer_update'] = ['address' => 'auto', 'name' => 'auto'];
		unset($payment['customer_email']);
	}
} catch (Exception $err) {
}

$results = $database->Query('SELECT products.game_id, products.tag, products.product_id, product_prices.price_id FROM products INNER JOIN product_prices ON (product_prices.product_id = products.product_id) WHERE product_prices.currency = $1;', $currency);
$product_map = [];
$products = [];
while (!$results->EOF()) {
	$product_id = $results->Field('product_id');
	$price_id = $results->Field('price_id');
	$game_id = $results->Field('game_id');
	$tag = $results->Field('tag');
	
	$product_map[$product_id] = [
		'PriceId' => $price_id,
		'GameId' => $game_id,
		'Tag' => $tag
	];
	
	$products[$game_id][$tag] = [
		'ProductId' => $product_id,
		'PriceId' => $price_id
	];
	
	$results->MoveNext();
}

$lines = [];
foreach ($bundles as $bundle) {
	$bundle = new CartBundle($bundle);
	
	$wantsArk = $bundle->getQuantity($products['Ark']['Base']['ProductId']) > 0;
	$wantsArkSAYears = $bundle->getQuantity($products['ArkSA']['Base']['ProductId']) + $bundle->getQuantity($products['ArkSA']['Upgrade']['ProductId']) + $bundle->getQuantity($products['ArkSA']['Renewal']['ProductId']);
	
	if ($bundle->isGift()) {
		if ($wantsArk) {
			$lines[$products['Ark']['Base']['PriceId']] = ($lines[$products['Ark']['Base']['PriceId']] ?? 0) + 1;
		}
		
		if ($wantsArkSAYears > 0) {
			if ($wantsArk) {
				$lines[$products['ArkSA']['Upgrade']['PriceId']] = ($lines[$products['ArkSA']['Upgrade']['PriceId']] ?? 0) + 1;
			} else {
				$lines[$products['ArkSA']['Base']['PriceId']] = ($lines[$products['ArkSA']['Base']['PriceId']] ?? 0) + 1;
			}
			if ($wantsArkSAYears > 1) {
				$lines[$products['ArkSA']['Renewal']['PriceId']] = ($lines[$products['ArkSA']['Renewal']['PriceId']] ?? 0) + ($wantsArkSAYears - 1);
			}
		}
	} else {
		$ownsArk = findLicense($licenses, $products['Ark']['Base']['ProductId']) !== null;
		$ownsArkSA = findLicense($licenses, $products['ArkSA']['Base']['ProductId']) !== null;
		
		if ($wantsArk && !$ownsArk) {
			$lines[$products['Ark']['Base']['PriceId']] = ($lines[$products['Ark']['Base']['PriceId']] ?? 0) + 1;
		}
		
		if ($wantsArkSAYears > 0) {
			if ($ownsArkSA) {
				$lines[$products['ArkSA']['Renewal']['PriceId']] = ($lines[$products['ArkSA']['Renewal']['PriceId']] ?? 0) + $wantsArkSAYears;
			} else {
				if ($ownsArk) {
					$lines[$products['ArkSA']['Upgrade']['PriceId']] = ($lines[$products['ArkSA']['Upgrade']['PriceId']] ?? 0) + 1;
				} else {
					$lines[$products['ArkSA']['Base']['PriceId']] = ($lines[$products['ArkSA']['Base']['PriceId']] ?? 0) + 1;
				}
				if ($wantsArkSAYears > 1) {
					$lines[$products['ArkSA']['Renewal']['PriceId']] = ($lines[$products['ArkSA']['Renewal']['PriceId']] ?? 0) + ($wantsArkSAYears - 1);
				}
			}
		}
	}
}
foreach ($lines as $priceId => $quantity) {
	$payment['line_items'][] = [
		'price' => $priceId,
		'quantity' => $quantity
	];
}

$encoded_cart = BeaconCommon::Base64UrlEncode(gzencode(json_encode($bundles)));
if (strlen($encoded_cart) > 500) {
	http_response_code(400);
	echo json_encode(['error' => true, 'message' => 'Cart is too large.'], JSON_PRETTY_PRINT);
	exit;
}
$payment['metadata']['Beacon Cart'] = $encoded_cart;

$session = $api->CreateCheckoutSession($payment);
if (is_null($session)) {
	http_response_code(400);
	echo json_encode(['error' => true, 'message' => 'Was not able to create the checkout session.'], JSON_PRETTY_PRINT);
	exit;
}

http_response_code(200);
echo json_encode([
	'error' => false,
	'client_reference_id' => $client_reference_id,
	'url' => $session['url']
], JSON_PRETTY_PRINT);

function createLineItem(string $uuid, string $currency, int $quantity) {
	if ($quantity <= 0) {
		return null;
	}
	
	$database = BeaconCommon::Database();
	$rows = $database->Query('SELECT price_id FROM product_prices WHERE product_id = $1 AND currency = $2;', $uuid, $currency);
	if ($rows->RecordCount() === 0) {
		return null;
	}
	
	return [
		'price' => $rows->Field('price_id'),
		'quantity' => $quantity
	];
}

class CartBundle {
	protected $source;
	
	public function __construct(array $source) {
		$this->source = $source;
	}
	
	public function getQuantity(string $productId): int {
		if (array_key_exists($productId, $this->source['products'])) {
			return $this->source['products'][$productId];
		} else {
			return 0;
		}
	}
	
	public function isGift(): bool {
		return $this->source['isGift'];
	}
}

function findLicense(array $licenses, string $productId): ?array {
	foreach ($licenses as $license) {
		if ($license['product_id'] === $productId) {
			return $license;
		}
	}
	return null;
}

?>
