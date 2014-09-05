import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  order: DS.attr('string'),
  description: DS.attr('string'),
  duration: DS.attr('number'),
  videoUrl: DS.attr('string'),
  codeUrl: DS.attr('string'),
  repoUrl: DS.attr('string'),
  posterUrl: DS.attr('string'),
  demo: DS.attr('boolean'),
  section: DS.belongsTo('section'),

  allChapters: (function() {
    return this.get('store').all('chapter');
  }).property(),

  nextChapter: (function() {
    return this.get('allChapters').objectAt(this.get('currentIndex') + 1);
  }).property('currentIndex'),

  previousChapter: (function() {
    return this.get('allChapters').objectAt(this.get('currentIndex') - 1);
  }).property('currentIndex'),

  progress: (function() {
    return (this.get('currentIndex') + 1) / this.get('allChapters.length');
  }).property('currentIndex'),

  isRestricted: (function() {
    return this.get('section.course.demo') && !this.get('demo');
  }).property('section.course.demo', 'demo'),

  currentIndex: (function() {
    return this.get('allChapters').indexOf(this);
  }).property('allChapters.@each')
});
