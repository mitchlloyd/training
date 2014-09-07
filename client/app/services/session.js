/* globals Stripe */
import Ember from 'ember';
var $ = Ember.$;

function registrationDataFromUrl(url) {
  var matches = url.match(/\?code=(\d+)/);

  if (matches && matches.length === 2) {
    return {registration_code: matches[1]};
  } else {
    return {};
  }
}

function initializeStripe(key) {
  Stripe.setPublishableKey(key);
}

function setupCsrfHeaders(token) {
  $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    return jqXHR.setRequestHeader('X-CSRF-Token', token);
  });
}

export default Ember.Service.extend({
  setup: function(url) {
    return $.get(
      '/training/api/sessions',
      registrationDataFromUrl(url)
    ).then(this.requestDidReturn);
  },

  requestDidReturn: function(response) {
    setupCsrfHeaders(response.authenticity_token);
    initializeStripe(response.stripe_public_key);
  }
});
