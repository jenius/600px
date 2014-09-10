https = require 'https'
url   = require 'url'
rest  = require 'rest'
mime  = require 'rest/interceptor/mime'

class Request

  constructor: (opts) ->
    @pathname = '/v1/'
    @host = 'api.500px.com'
    @consumer_key = opts.consumer_key
    @client = rest.wrap(mime)

  get: (path, params) ->
    params.consumer_key = @consumer_key

    req_url = url.format
      protocol: 'https'
      host: @host
      pathname: "#{@pathname}/#{path}"
      query: params

    @client(req_url).then((res) -> res.entity)

module.exports = Request
