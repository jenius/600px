https  = require 'https'
url    = require 'url'
uuid   = require 'node-uuid'
Purest = require 'purest'
W      = require 'when'

class Request

  constructor: (opts) ->
    @consumer_key = opts.consumer_key
    @consumer_secret = opts.consumer_secret
    @token = opts.token
    @token_secret = opts.token_secret
    @api = new Purest(provider: '500px')

  get: (path, params) -> @req('get', path, params)

  req: (method, path, params) ->
    d = W.defer()
    try
      @api[method] path, generate_headers.call(@, params), (err, res, body) ->
        if err then d.reject(err)
        d.resolve(body)
    catch err
      d.reject(err)
    return d.promise

  # private

  generate_headers = (params) ->
    res = {}
    res.json = params
    res.oauth =
      consumer_key: @consumer_key
      consumer_secret: @consumer_secret
      token: @token
      token_secret: @token_secret
    res

module.exports = Request
