class Photos

  constructor: (@request) ->

  getById: (id, params = {}) ->
    @request.get("photos/#{id}", params)

  getComments: (id, params = {}) ->
    @request.get("photos/#{id}/comments", params)

  getFavorites: (id, params = {}) ->
    @request.get("photos/#{id}/favorites", params)

  getVotes: (id, params = {}) ->
    @request.get("photos/#{id}/votes", params)

  getByUsername: (username, params = {}) ->
    params.feature = 'user'
    params.username = username
    @request.get('photos', params)

  getByUserId: (user_id, params = {}) ->
    params.feature = 'user'
    params.user_id = user_id
    @request.get('photos', params)

  getFavoritesByUsername: (username, params = {}) ->
    params.feature = 'user_favorites'
    params.username = username
    @request.get('photos', params)

  getFavoritesByUserId: (user_id, params = {}) ->
    params.feature = 'user_favorites'
    params.user_id = user_id
    @request.get('photos', params)

  getFriendsByUsername: (username, params = {}) ->
    params.feature = 'user_friends'
    params.username = username
    @request.get('photos', params)

  getFriendsByUserId: (user_id, params = {}) ->
    params.feature = 'user_friends'
    params.user_id = user_id
    @request.get('photos', params)

  getPopular: (params = {}) ->
    params.feature = 'popular'
    @request.get('photos', params)

  getUpcoming: (params = {}) ->
    params.feature = 'upcoming'
    @request.get('photos', params)

  getEditorsChoice: (params = {}) ->
    params.feature = 'editors'
    @request.get('photos', params)

  getFreshToday: (params = {}) ->
    params.feature = 'fresh_today'
    @request.get('photos', params)

  getFreshYesterday: (params = {}) ->
    params.feature = 'fresh_yesterday'
    @request.get('photos', params)

  getFreshWeek: (params = {}) ->
    params.feature = 'fresh_week'
    @request.get('photos', params)

  searchByTag: (tag, params = {}) ->
    params.tag = tag
    @request.get('photos/search', params)

  searchByTerm: (term, params = {}) ->
    params.term = term
    @request.get('photos/search', params)

module.exports = Photos
