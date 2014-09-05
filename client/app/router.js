import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ClassroomENV.locationType
});

Router.map(function() {
  this.resource("course", {path: '/courses/:course_id'}, function() {
    this.route("register");
    this.resource("chapters", function() {
      this.resource("chapter", {path: ":chapter_id"});
    });
  });
});

export default Router;
