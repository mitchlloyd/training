import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource("course", {path: '/courses/:course_id'}, function() {
    this.route("register");
    this.resource("chapters", function() {
      this.resource("chapter", {path: ":chapter_id"});
    });
  });
  this.route("notFound", { path: "*path"});
});

export default Router;
