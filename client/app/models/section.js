import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  course: DS.belongsTo('course'),
  chapters: DS.hasMany('chapter'),

  allSections: (function() {
    return this.get('store').all('section');
  }).property(),

  currentIndex: (function() {
    return this.get('allSections').indexOf(this);
  }).property('allSections.@each')
});
