import Ember from 'ember';

export default Ember.Component.extend({
  classNames: "modal",
  classNameBindings: ['active:modal--active'],

  actions: {
    deactivate: function() {
      return this.set('active', false);
    }
  }
});
