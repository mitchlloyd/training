import Ember from 'ember';

export default Ember.ArrayController.extend({
  needs: ['course'],
  courseTitle: (function() {
    return this.get('controllers.course.title');
  }).property('controllers.course'),
  firstChapter: (function() {
    return this.get('store').all('chapter').findBy('demo', true);
  }).property('controllers.course')
});

