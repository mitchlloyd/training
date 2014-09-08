/* globals Spinner */
import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'div',
  classNames: 'spinner',

  didInsertElement: function() {
    new Spinner({
      color:'#aaa',
      lines: 12,
      radius: 7,
      width: 3
    }).spin(this.element);
  }
});

