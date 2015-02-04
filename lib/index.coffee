Photos      = require './photos'
Users       = require './users'
Blogs       = require './blogs'
Collections = require './collections'
Request     = require './request'

class API

  constructor: (opts) ->
    request = new Request(opts)
    @photos = new Photos(request)
    @users = new Users(request)
    @blogs = new Blogs(request)
    @collections = new Collections(request)

module.exports = API
