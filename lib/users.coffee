class Users

  constructor: (@request) ->

  getById: (id, params = {}) ->
    params.id = id
    @request.get('users/show', params)

  getByName: (username, params = {}) ->
    params.username = username
    @request.get('users/show', params)

  getByEmail: (email, params = {}) ->
    params.email = email
    @request.get('users/show', params)

  getFriends: (id, params = {}) ->
    @request.get("users/#{id}/friends", params)

  getFollowers: (id, params = {}) ->
    @request.get("users/#{id}/followers", params)

  search: (term, params = {}) ->
    params.term = term
    @request.get("users/search", params)

module.exports = Users
