describe 'collections', ->
  Collections = (new API(config)).collections

  it 'get() should return the authorized user\'s collections', ->
    Collections.get().then (res) ->
      res.collections.should.be.an('array')
      res.collections.length.should.be.above(1)
    .should.be.fulfilled

  it 'getById() should return a user\'s collection by id', ->
    Collections.getById(config.collection_id).then (res) ->
      res.id.toString().should.equal(config.collection_id)
    .should.be.fulfilled
