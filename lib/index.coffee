Photos  = require './photos'
Users   = require './users'
Blogs   = require './blogs'
Request = require './request'

class API

  constructor: (opts) ->
    request = new Request(opts)
    @photos = new Photos(request)
    @users = new Users(request)
    @blogs = new Blogs(request)

module.exports = API
