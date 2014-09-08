/* globals Showdown */
import Ember from 'ember';
var markdownConverter = new Showdown.converter();

export default Ember.Handlebars.makeBoundHelper(function(text) {
  if (text == null) {
    return;
  }
  return new Ember.Handlebars.SafeString(markdownConverter.makeHtml(text));
});
