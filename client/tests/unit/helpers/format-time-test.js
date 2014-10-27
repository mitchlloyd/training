import { test } from 'ember-qunit';
import Ember from 'ember';
import { formatTime } from 'classroom/helpers/format-time';

module("format-time");

test("formatting seconds", function() {
  equal(formatTime(1), '0:01', "single digit second");
  equal(formatTime(60 * 2), '2:00', "single digit minute");
  equal(formatTime(60 * 11), '11:00', "double digit minute");
  equal(formatTime(60 * 60 * 1), '1:00:00', "single digit hour");
  equal(formatTime(60 * 60 * 11), '11:00:00', "double digit hour");
});
