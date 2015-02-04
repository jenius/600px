describe 'errors', ->

  it 'should error if authentication not provided when necessary', ->
    Collections = (new API(consumer_key: 'foobar')).collections
    Collections.get().should.be.rejected
