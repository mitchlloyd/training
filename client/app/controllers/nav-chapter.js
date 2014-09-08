import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: 'chapter',

  isActive: (function() {
    return this.get('controllers.chapter.model') === this.get('model');
  }).property('controllers.chapter.model')
});
