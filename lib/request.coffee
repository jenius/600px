https  = require 'https'
url    = require 'url'
uuid   = require 'node-uuid'
rest   = require 'rest'
mime   = require 'rest/interceptor/mime'
prefix = require 'rest/interceptor/pathPrefix'
error  = require 'rest/interceptor/errorCode'

class Request

  constructor: (opts) ->
    @consumer_key = opts.consumer_key
    @token = opts.token

    base_path = url.format
      protocol: 'https'
      host: 'api.500px.com'
      pathname: 'v1'

    @request = rest.wrap(mime)
                   .wrap(prefix, prefix: base_path)
                   .wrap(error)

  get: (path, params) ->
    if not @token then params.consumer_key = @consumer_key
    req_url = generate_url.call(@, path, params)
    headers = if @token then generate_headers.call(@) else {}

    @request(path: req_url, headers: headers)
      # .tap(console.log)
      .then((res) -> res.entity)

  put: (path, params) ->
    req_url = generate_url.call(@, path)
    headers = generate_headers.call(@)

    @request(path: req_url, method: 'PUT', entity: params, headers: headers)
      .then((res) -> res.entity)

  #
  # private
  #

  generate_url = (path, params) ->
    "#{path}/#{url.format(query: params)}"

  generate_headers = ->
    params = [
      "oauth_consumer_key=\"#{@consumer_key}\"",
      "oauth_signature_method=\"HMAC-SHA1\"",
      "oauth_timestamp=\"#{new Date().getTime()}\"",
      "oauth_nonce=\"#{uuid.v1()}\"",
      "oauth_version=\"1.0\""
      "oauth_token=\"#{@token}\""
    ]
    Authorization: "OAuth #{params.join(',')}"

module.exports = Request
