import Ember from 'ember';
var $ = Ember.$;

export default Ember.Service.extend({
  setup: function(url) {
    var matches = url.match(/\?code=(\d+)/);

    if (matches && matches.length === 2) {
      return $.get(
        '/training/api/sessions',
        {registration_code: matches[1]}
      ).then(this.csrfRequestDidReturn);
    }
  },

  csrfRequestDidReturn: function(response) {
    $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
      return jqXHR.setRequestHeader('X-CSRF-Token', response.authenticity_token);
    });
  }
});
