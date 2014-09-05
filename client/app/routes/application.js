import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    flash: function(message, status) {
      return this.controllerFor('flash').add(message, status);
    }
  }
});
