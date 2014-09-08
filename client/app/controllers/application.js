import Ember from 'ember';
var $ = Ember.$;

export default Ember.Controller.extend({
  needs: ['flash'],
  flashBinding: 'controllers.flash',
  defaultTitle: "Classroom",

  init: function() {
    this.setDefaultTitle();
    return this.createLinkElement();
  },

  setDefaultTitle: function() {
    return this.set('title', this.get('defaultTitle'));
  },

  titleDidChange: (function() {
    return document.title = this.get('title');
  }).observes('title'),

  createLinkElement: function() {
    this.set('linkElement', $("<link rel='stylesheet' class='theme-link'></link>"));
    return $('head').append(this.get('linkElement'));
  },

  setThemeUrl: function(url) {
    return this.get('linkElement').attr('href', url);
  }
});
