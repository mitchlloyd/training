import Ember from 'ember';
var service = Ember.inject.service;

export default Ember.Route.extend({
  session: service(),

  model: function() {
    return this.get('session').setup(document.URL);
  },

  actions: {
    flash: function(message, status) {
      return this.controllerFor('flash').add(message, status);
    }
  }
});
