import Ember from 'ember';
var service = Ember.inject.service;

export default Ember.Route.extend({
  session: service(),

  redirect: function() {
    this.transitionTo('course', this.get('session.courseId'));
  }
});
