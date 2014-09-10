should = require 'should'
config = require './config'
API  = require '../lib'

describe 'Testing GET users:', ->
  users = (new API(consumer_key: config.secrets.consumer_key)).users
  user_id = config.secrets.user_id
  user_name = config.secrets.user_name
  user_email = config.secrets.user_email

  it '#getById() should return json with the user data', (done) ->
    users.getById(user_id).then (res) ->
      res.should.have.property('user')
      done()

  it '#getByName() should return json with the user data', (done) ->
    users.getByName(user_name).then (res) ->
      res.should.have.property('user')
      done()

  it '#getByEmail() should return json with the user data', (done) ->
    users.getByEmail(user_email).then (res) ->
      res.should.have.property('user')
      done()

  it '#getFriends() should return json with friends data', (done) ->
    users.getFriends(user_id).then (res) ->
      res.should.have.property('friends')
      done()

  it '#getFollowers() should return json with followers data', (done) ->
    users.getFollowers(user_id).then (res) ->
      res.should.have.property('followers')
      done()

  it '#search() should return json with search results', (done) ->
    users.search(user_name).then (res) ->
      res.should.have.property('users')
      done()
