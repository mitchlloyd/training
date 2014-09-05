import Ember from 'ember';

export default Ember.ObjectController.extend({
  needs: 'chapter',

  isActive: (function() {
    return this.get('controllers.chapter.section') === this.get('model');
  }).property('controllers.chapter.model'),

  position: (function() {
    var position;
    position = this.get('currentIndex') + 1;
    if (position.toString().length <= 1) {
      return "0" + position;
    }
    return position;
  }).property('currentIndex'),

  currentChapterPosition: (function() {
    return this.get('model.chapters').indexOf(this.get('controllers.chapter.model')) + 1;
  }).property('controllers.chapter.model')
});
