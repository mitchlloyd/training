import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return this.get('store').createRecord('registration', {
      course: this.modelFor('course')
    });
  },

  setupController: function(controller, model) {
    controller.set('model', model);
    return controller.set('card', Ember.Object.create());
  }
});
