/* globals Stripe */
import Ember from 'ember';
var $ = Ember.$;

function registrationDataFromUrl(url) {
  var matches = url.match(/\?code=([a-z0-9]+)/);

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
    ).then(this.requestDidReturn.bind(this));
  },

  requestDidReturn: function(response) {
    setupCsrfHeaders(response.authenticity_token);
    initializeStripe(response.stripe_public_key);
    this.set('courseId', response.course_id);
  }
});
