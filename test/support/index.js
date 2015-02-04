var chai = require('chai'),
    chai_promise = require('chai-as-promised');

var should = chai.should();
chai.use(chai_promise);

global.should = should;
