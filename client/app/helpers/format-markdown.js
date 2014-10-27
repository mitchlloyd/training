/* globals Showdown */
import Ember from 'ember';
var makeHtml = new Showdown.converter().makeHtml;

export function formatMarkdown(text) {
  if (text == null) {
    return;
  }

  return makeHtml(text).htmlSafe();
}

export default Ember.Handlebars.makeBoundHelper(formatMarkdown);
