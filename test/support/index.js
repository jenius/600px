var chai = require('chai'),
    chai_promise = require('chai-as-promised'),
    config = require('./config'),
    API = require('../..');

var should = chai.should();
chai.use(chai_promise);

global.should = should;
global.config = config;
global.API = API;
