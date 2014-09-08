import { moduleFor, test } from 'ember-qunit';
import Em from 'ember';

var chapters, section, navSectionController, chapterController;

moduleFor('controller:nav-section', "nav-section - currentChapterPosition", {
  needs: ['controller:chapter'],
  setup: function() {
    chapters = [Em.Object.create(), Em.Object.create()];
    section = Em.Object.create({chapters: chapters});
    chapterController = this.container.lookup('controller:chapter');
    navSectionController = this.subject({model: section});
  }
});

test("when the user is on the first chapter in this section", function() {
  chapterController.set('model', chapters[0]);
  equal(navSectionController.get('currentChapterPosition'), 1);
});

test("when the user in on the second chapter in this section", function() {
  chapterController.set('model', chapters[1]);
  equal(navSectionController.get('currentChapterPosition'), 2);
});

test("with the current chapter not in this section", function() {
  chapterController.set('model', {});
  equal(navSectionController.get('currentChapterPosition'), 0);
});
