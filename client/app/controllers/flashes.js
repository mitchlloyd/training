import Ember from 'ember';

export default Ember.ObjectController.extend({
  statusClass: (function() {
    return "flash--" + (this.get('status'));
  }).property('status'),

  init: function() {
    return this.set('content', {
      message: null,
      status: null
    });
  },

  add: function(message, status) {
    return this.setProperties({
      message: message,
      status: status
    });
  }
});
