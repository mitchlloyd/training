import Ember from 'ember';

export default Ember.Route.extend({
  afterModel: function(model, transition) {
    if (model.get('isRestricted')) {
      this.send('purchase');
      return transition.abort();
    }
    return this.controllerFor('application').set('title', (model.get('section.title')) + " - " + (model.get('title')));
  }
});
