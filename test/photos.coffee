describe 'photos', ->
  Photos = (new API(config)).photos

  it 'getById() should return a json with the photo data', ->
    Photos.getById(3086230).then (res) ->
      res.should.have.property('photo')
    .should.be.fulfilled

  it 'getComments() should return a json with the photo\'s comment data', ->
    Photos.getComments(3086230).then (res) ->
      res.should.have.property('comments')
    .should.be.fulfilled

  it 'getFavorites() should return a json with the photo\'s favorites', ->
    Photos.getFavorites(3086230).then (res) ->
      res.should.have.property('users')
    .should.be.fulfilled

  it 'getVotes() should return a json with the photo\'s votes', ->
    Photos.getVotes(3086230).then (res) ->
      res.should.have.property('users')
    .should.be.fulfilled

  it 'getByUsername() should return a json with photos', ->
    Photos.getByUsername(config.user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getByUserId() should return a json with photos', ->
    Photos.getByUserId(config.user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFavoritesByUsername() should return a json with photos', ->
    Photos.getFavoritesByUsername(config.user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFavoritesByUserId() should return a json with photos', ->
    Photos.getFavoritesByUserId(config.user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFriendsByUsername() should return a json with photos', ->
    Photos.getFriendsByUsername(config.user_name, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFriendsByUserId() should return a json with photos', ->
    Photos.getFriendsByUserId(config.user_id, rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getPopular() should return a json with photos', ->
    Photos.getPopular(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getUpcoming() should return a json with photos', ->
    Photos.getUpcoming(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getEditorsChoice() should return a json with photos', ->
    Photos.getEditorsChoice(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFreshToday() should return a json with photos', ->
    Photos.getFreshToday(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFreshYesterday() should return a json with photos', ->
    Photos.getFreshYesterday(rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'getFreshWeek() should return a json with photos', ->
    Photos.getFreshWeek().then (res) ->
      res.should.have.property('photos')
    .should.be.fulfilled

  it 'searchByTag() should return a json with photos', ->
    Photos.searchByTag('hamburg', rpp: 7).then (res) ->
      res.should.have.property('photos')
      res.photos.should.have.lengthOf(7)
    .should.be.fulfilled

  it 'searchByTerm() should return a json with photos', ->
    Photos.searchByTerm('hamburg').then (res) ->
      res.should.have.property('photos')
    .should.be.fulfilled
