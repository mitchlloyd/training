import { test } from 'ember-qunit';
import Ember from 'ember';
import { formatMarkdown } from 'classroom/helpers/format-markdown';

module("format-markdown");

test("turning markdown into HTML", function() {
  var output = formatMarkdown("## Description");
  equal(output.toString(), '<h2 id="description">Description</h2>');
  ok(output instanceof Ember.Handlebars.SafeString);
});

