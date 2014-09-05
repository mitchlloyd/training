import Ember from 'ember';
var markdownConverter = new Showdown.converter();

export default Ember.Handlebars.makeBoundHelper('markdown', function(text, options) {
  if (text == null) {
    return;
  }
  return new Handlebars.SafeString(markdownConverter.makeHtml(text));
});
