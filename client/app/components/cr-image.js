import Ember from 'ember';

var IMAGE_PREFIX = '/training/classroom/assets/images/'

export default Ember.Component.extend({
  tagName: 'img',
  attributeBindings: ['src', 'alt'],

  src: function() {
    return IMAGE_PREFIX + this.get('path');
  }.property('path')
});

