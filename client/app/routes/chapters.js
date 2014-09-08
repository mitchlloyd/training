import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    toggleSidebar: function() {
      return this.controller.toggleProperty('isSidebarActive');
    }
  }
});

