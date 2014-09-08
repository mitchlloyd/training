import Ember from 'ember';

export default Ember.Route.extend({
  afterModel: function(model) {
    this.controllerFor('application').set('title', model.get('title'));
    return this.controllerFor('application').setThemeUrl("/training/courses/" + (model.get('id')) + "/theme.css");
  },

  actions: {
    purchase: function() {
      return this.get('controller').purchase();
    }
  }
});
