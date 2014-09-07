import { test } from 'ember-qunit';
import Ember from 'ember';
import resolver from '../../helpers/resolver';

module("format-time");

function format(seconds) {
  return resolver.resolve('helper:format-time')._rawFunction(seconds);
}

test("formatting seconds", function() {
  equal(format(1), '0:01', "single digit second");
  equal(format(60 * 2), '2:00', "single digit minute");
  equal(format(60 * 11), '11:00', "double digit minute");
  equal(format(60 * 60 * 1), '1:00:00', "single digit hour");
  equal(format(60 * 60 * 11), '11:00:00', "double digit hour");
});
