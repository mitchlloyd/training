import Ember from 'ember';
var service = Ember.inject.service;

export default Ember.Route.extend({
  session: service(),

  redirect: function() {
    var courseId = this.get('session.courseId');

    if (courseId) {
      this.transitionTo('course', courseId);
    } else {
      window.location = "/training";
    }
  }
});
