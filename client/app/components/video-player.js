/* globals videojs */
import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['video-player'],
  classNameBindings: ['isPlaying:video-player--playing:video-player--paused'],
  isPlaying: false,
  playerOptions: {
    width: false,
    height: false,
    controls: true,
    preload: "auto",
    flash: {
      swf: "http://assets1.gaslight.co/javascripts/video-js.swf"
    }
  },

  didInsertElement: function() {
    this.player = videojs('player', this.playerOptions);
    this.player.on("play", (function(_this) {
      return function() {
        return _this.set("isPlaying", true);
      };
    })(this));
    this.player.on("pause", (function(_this) {
      return function() {
        return _this.set("isPlaying", false);
      };
    })(this));
    this.player.on("ended", (function(_this) {
      return function() {
        return _this.set("isPlaying", false);
      };
    })(this));
    if (this.player.techName === "Flash") {
      return this.setupFlashPlayer();
    }
  },

  setupFlashPlayer: function() {
    var width;
    width = this.$().width();
    this.player.width(width);
    return this.player.height(width * (9 / 16));
  },

  willDestroyElement: function() {
    return this.player.dispose();
  },

  updateSrc: function() {
    if (this.get('src') != null) {
      this.player.src(this.get('src'));
    }
    if (this.get('poster') != null) {
      return this.player.poster(this.get('poster'));
    }
  },

  srcDidChange: (function() {
    if (this.player == null) {
      return;
    }
    this.player.currentTime(0);
    this.player.pause();
    return Ember.run.next((function(_this) {
      return function() {
        return _this.updateSrc();
      };
    })(this));
  }).observes('src')
});
