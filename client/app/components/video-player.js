/* globals videojs */
import Ember from 'ember';
var run = Ember.run.bind;

var PLAYER_OPTIONS = {
  width: false,
  height: false,
  controls: true,
  preload: "auto",
  flash: {
    swf: "http://assets1.gaslight.co/javascripts/video-js.swf"
  }
};

export default Ember.Component.extend({
  classNames: ['video-player'],
  classNameBindings: ['isPlaying:video-player--playing:video-player--paused'],
  isPlaying: false,

  didInsertElement: function() {
    this.player = videojs('player', PLAYER_OPTIONS);
    this.player.on("play", run(this, this.didPlay));
    this.player.on("pause", run(this, this.didPause));
    this.player.on("ended", run(this, this.didEnd));

    if (this.player.techName === "Flash") {
      this.setupFlashPlayer(this.$().width());
    }
  },

  setupFlashPlayer: function(width) {
    this.player.width(width);
    this.player.height(width * (9 / 16));
  },

  didPlay: function() {
    this.set('isPlaying', true);
  },

  didPause: function() {
    this.set("isPlaying", false);
  },

  didEnd: function() {
    this.set("isPlaying", false);
  },

  willDestroyElement: function() {
    this.player.dispose();
  },

  updateSrc: function() {
    if (this.get('src') != null) {
      this.player.src(this.get('src'));
    }
    if (this.get('poster') != null) {
      this.player.poster(this.get('poster'));
    }
  },

  srcDidChange: (function() {
    if (!this.player) {
      return;
    }
    this.player.currentTime(0);
    this.player.pause();
    Ember.run.scheduleOnce('afterRender', this, this.updateSrc);
  }).observes('src')
});
