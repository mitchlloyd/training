import Ember from 'ember';
import fakeStripe from './fake-stripe';
import Pretender from 'pretender';

function setupPretender(arrayOfStubs) {
  return new Pretender(function() {
    var server = this;

    arrayOfStubs.forEach(function(func) {
      func.call(server);
    });
  });
}

function setupApiStubs(stubs, app) {
  var fakeServer;

  if (stubs) {
    fakeServer = setupPretender(stubs);
  } else {
    fakeServer = {shutdown: Ember.K};
  }

  app.addObserver('isDestroying', function() {
    fakeServer.shutdown();
  });
}
import Application from '../../app';
import Router from '../../router';
import config from '../../config/environment';

export default function startApp(attrs) {
  var App;

  var attributes = Ember.merge({}, config.APP);
  attributes = Ember.merge(attributes, attrs); // use defaults, but you can override;

  Router.reopen({
    location: 'none'
  });

  Ember.run(function() {
    App = Application.create(attributes);
    App.setupForTesting();
    App.injectTestHelpers();
  });

  App.reset(); // this shouldn't be needed, i want to be able to "start an app at a specific URL"

  // We can never use the real Stripe library in our client-side tests so we fake it out.
  fakeStripe();

  setupApiStubs(attrs.apiStubs, App);

  return App;
}
