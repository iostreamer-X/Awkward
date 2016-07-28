require('coffee-script/register');

var assert = require('assert');
var core = require('../terminal/core.coffee');

describe('Checking if core works',function () {
  it(' the commands should work without throwing any error',function () {
    core('ls');
    core('ls().forEach(console.log)');
  });
});
