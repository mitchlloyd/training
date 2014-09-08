import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: ['chapter', 'application'],
  isModalActive: false,

  actions: {
    register: function() {
      this.set('isModalActive', false);
      return this.transitionToRoute('course.register', this.get('model'));
    }
  },

  barStyle: (function() {
    return "width: " + (this.get('controllers.chapter.progress') * 100) + "%";
  }).property('controllers.chapter.progress'),

  purchase: function() {
    return this.set('isModalActive', true);
  },

  currentRoute: (function() {
    return this.get('controllers.application.currentRouteName');
  }).property('controllers.application.currentRouteName'),

  isRegistering: (function() {
    return this.get('currentRoute') === 'course.register';
  }).property('currentRoute'),

  showBlurb: (function() {
    return this.get('demo') && !this.get('isRegistering');
  }).property('demo', 'isRegistering')
});

