should = require 'should'
config = require './config'
API = require '../lib'

describe 'Testing GET photos:', ->
  photos = (new API(consumer_key: config.secrets.consumer_key)).photos
  user_id = config.secrets.user_id
  user_name = config.secrets.user_name

  it '#getById() should return a json with the photo data', (done) ->
    photos.getById(3086230).then (res) ->
      res.should.have.property('photo')
      done()

  it '#getComments() should return a json with the photo\'s comment data', (done) ->
    photos.getComments(3086230).then (res) ->
      res.should.have.property('comments')
      done()

  it '#getFavorites() should return a json with the photo\'s favorites', (done) ->
    photos.getFavorites(3086230).then (res) ->
      res.should.have.property('users')
      done()

  it '#getVotes() should return a json with the photo\'s votes', (done) ->
    photos.getVotes(3086230).then (res) ->
      res.should.have.property('users')
      done()

  it '#getByUsername() should return a json with photos', (done) ->
    photos.getByUsername(user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getByUserId() should return a json with photos', (done) ->
    photos.getByUserId(user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFavoritesByUsername() should return a json with photos', (done) ->
    photos.getFavoritesByUsername(user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFavoritesByUserId() should return a json with photos', (done) ->
    photos.getFavoritesByUserId(user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFriendsByUsername() should return a json with photos', (done) ->
    photos.getFriendsByUsername(user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFriendsByUserId() should return a json with photos', (done) ->
    photos.getFriendsByUserId(user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getPopular() should return a json with photos', (done) ->
    photos.getPopular(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getUpcoming() should return a json with photos', (done) ->
    photos.getUpcoming(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getEditorsChoice() should return a json with photos', (done) ->
    photos.getEditorsChoice(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFreshToday() should return a json with photos', (done) ->
    photos.getFreshToday(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFreshYesterday() should return a json with photos', (done) ->
    photos.getFreshYesterday(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#getFreshWeek() should return a json with photos', (done) ->
    photos.getFreshWeek().then (res) ->
      res.should.have.property('photos')
      done()

  it '#searchByTag() should return a json with photos', (done) ->
    photos.searchByTag('hamburg', rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
      done()

  it '#searchByTerm() should return a json with photos', (done) ->
    photos.searchByTerm('hamburg').then (res) ->
      res.should.have.property('photos')
      done()
