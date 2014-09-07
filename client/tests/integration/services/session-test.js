import Ember from "ember";
import { test } from 'ember-qunit';
import resolver from '../../helpers/resolver';
import Pretender from 'pretender';

module('session service');

test('it performs a get request with the registration code', function() {
  expect(1);
  var session = resolver.resolve('service:session').create();

  var server = new Pretender(function(){
    this.post('/training/api/sessions', function(request){
      equal(request.requestBody, "registration_code=123");
      return [200, {"Content-Type": "application/json"}, "{}"];
    });
  });

  session.setup('http://localhost/training/classroom/?code=123/#/courses/1/chapters/1');
  server.shutdown();
});
