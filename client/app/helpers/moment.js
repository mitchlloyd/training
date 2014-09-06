/* globals moment */
import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper('time', function(seconds) {
  var formatter, parsedTime;

  if (seconds == null) {
    return;
  }

  parsedTime = moment.utc(seconds * 1000);
  formatter = parsedTime.hours() > 0 ? "H:mm:ss" : "m:ss";
  return "" + (parsedTime.format(formatter));
});
