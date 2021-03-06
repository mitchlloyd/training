import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  introduction: DS.attr('string'),
  price: DS.attr('number'),
  demo: DS.attr('boolean'),
  sections: DS.hasMany('section')
});
