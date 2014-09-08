import { test } from 'ember-qunit';
import Ember from 'ember';
import resolver from '../../helpers/resolver';

module("format-markdown");

test("turning markdown into HTML", function() {
  var helper = resolver.resolve('helper:format-markdown')._rawFunction;
  var output = helper("## Description");
  equal(output.toString(), '<h2 id="description">Description</h2>');
  ok(output instanceof Ember.Handlebars.SafeString);
});

