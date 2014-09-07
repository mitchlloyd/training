import Ember from 'ember';
import { moduleForComponent, test } from 'ember-qunit';
var run = Ember.run.bind;

var player;
moduleForComponent("video-player", null, {
  setup: function() {
    player = this.subject()
    player.set('src', "/test/test.mp4");
    this.render();
  }
});

test('rendering the first time', function() {
  ok(player.player.currentSrc().match('test.mp4'));
});

test('changing the src', function() {
  Em.run(function() {
    player.set('src', "/test/test2.mp4");
  });

  ok(player.player.currentSrc().match('test2.mp4'));
});
