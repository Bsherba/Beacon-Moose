"use strict";

document.addEventListener('DOMContentLoaded', () => {
  var contactForm = document.getElementById('contactForm');
  var contactErrorNotice = document.getElementById('contactErrorNotice');
  var contactNameField = document.getElementById('contactNameField');
  var contactEmailField = document.getElementById('contactEmailField');
  var contactPlatformField = document.getElementById('contactPlatformField');
  var contactHostField = document.getElementById('contactHostField');
  var contactBodyField = document.getElementById('contactBodyField');
  var contactActionButton = document.getElementById('contactActionButton');
  var contactTimestampField = document.getElementById('contactTimestampField');
  var contactHashField = document.getElementById('contactHashField');
  var showError = message => {
    if (contactErrorNotice) {
      contactErrorNotice.innerHTML = message;
      contactErrorNotice.classList.remove('hidden');
    }
    if (contactActionButton) {
      contactActionButton.disabled = false;
    }
  };
  contactForm.addEventListener('submit', ev => {
    ev.preventDefault();
    if (!(contactActionButton && contactErrorNotice && contactNameField && contactEmailField && contactHashField && contactBodyField && contactPlatformField && contactTimestampField && contactHashField)) {
      console.log('Page is missing important elements');
      return false;
    }
    contactActionButton.disabled = true;
    contactErrorNotice.classList.add('hidden');
    var contactName = contactNameField.value.trim();
    if (contactName === '') {
      showError('Please enter a name');
      return;
    }
    var contactEmail = contactEmailField.value.trim();
    if (contactEmail === '') {
      showError('Please enter a valid email address');
      return;
    }
    var contactHost = contactHostField.value.trim();
    if (contactHost === '') {
      showError('Please fill in the host field');
      return;
    }
    var contactBody = contactBodyField.value.trim();
    if (contactBody === '') {
      showError('Please let us know how we can help');
      return;
    }
    var contactPlatform = contactPlatformField.value.trim();
    if (contactPlatform === '') {
      showError('Please select one of the platforms from the menu');
      return;
    }
    var contactTimestamp = contactTimestampField.value.trim();
    var contactHash = contactHashField.value.trim();
    var params = new URLSearchParams();
    params.append('name', contactName);
    params.append('email', contactEmail);
    params.append('platform', contactPlatform);
    params.append('host', contactHost);
    params.append('body', contactBody);
    params.append('timestamp', contactTimestamp);
    params.append('hash', contactHash);
    BeaconWebRequest.post('/help/ticket', params).then(response => {
      contactBodyField.value = '';
      contactActionButton.disabled = false;
      BeaconDialog.show('Your support request has been submitted.', 'You will receive an email confirmation shortly.');
    }).catch(error => {
      var message = "Sorry, there was an HTTP ".concat(error.status, " error.");
      try {
        var obj = JSON.parse(error.body);
        if (obj.message) {
          message = obj.message;
        }
      } catch (e) {
        console.log(e);
      }
      showError(message);
    });
  });
  if (contactEmailField) {
    var _sessionStorage$getIt, _sessionStorage, _localStorage;
    var storedEmail = (_sessionStorage$getIt = (_sessionStorage = sessionStorage) === null || _sessionStorage === void 0 ? void 0 : _sessionStorage.getItem('email')) !== null && _sessionStorage$getIt !== void 0 ? _sessionStorage$getIt : (_localStorage = localStorage) === null || _localStorage === void 0 ? void 0 : _localStorage.getItem('email');
    if (storedEmail) {
      contactEmailField.value = storedEmail;
    }
  }
});