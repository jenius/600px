class Collections

  constructor: (@request) ->

  get: (params = {}) ->
    @request.get('collections', params)

  getById: (id, params = {}) ->
    @request.get("collections/#{id}", params)

module.exports = Collections
