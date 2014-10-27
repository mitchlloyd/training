import Ember from 'ember';
import { startApp, stopApp } from '../helpers/start-app';
import validSession from '../api-stubs/valid-session';

var App;

module('handling unknown routes', {
  setup: function() {
    App = startApp({apiStubs: [validSession]});
  },
  teardown: function() {
    stopApp(App);
  }
});

test('going to an unknown route shows users a "not found" error screen', function() {
  visit('/boguspath');

  andThen(function() {
    equal(find('h1').text(), "Not Found");
  });
});
