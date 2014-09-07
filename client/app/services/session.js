import Ember from 'ember';
var $ = Ember.$;

export default Ember.Service.extend({
  setup: function(url) {
    var matches = url.match(/\?code=(\d+)/);

    if (matches && matches.length === 2) {
      var code = matches[1];
      $.post('/training/api/sessions', {registration_code: code});
    }
  }
});
