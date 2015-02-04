config = require './config'
API  = require '..'

describe 'users', ->
  Users = (new API(config)).users

  it 'get() should return the authorized user\'s data', ->
    Users.get().then (res) ->
      res.should.have.property('user')
      res.user.username.should.equal(config.user_name)
    .should.be.fulfilled

  it 'getById() should return json with the user data', ->
    Users.getById(config.user_id).then (res) ->
      res.should.have.property('user')
      res.user.username.should.equal(config.user_name)
    .should.be.fulfilled

  it 'getByName() should return json with the user data', (done) ->
    Users.getByName(config.user_name).then (res) ->
      res.should.have.property('user')
      done()

  it 'getByEmail() should return json with the user data', (done) ->
    Users.getByEmail(config.user_email).then (res) ->
      res.should.have.property('user')
      done()

  it 'getFriends() should return json with friends data', (done) ->
    Users.getFriends(config.user_id).then (res) ->
      res.should.have.property('friends')
      done()

  it 'getFollowers() should return json with followers data', (done) ->
    Users.getFollowers(config.user_id).then (res) ->
      res.should.have.property('followers')
      done()

  it 'search() should return json with search results', (done) ->
    Users.search(config.user_name).then (res) ->
      res.should.have.property('users')
      done()
