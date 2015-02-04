describe 'blogs', ->
  Blogs = (new API(config)).blogs

  it 'getById() should return a json with the blog data', ->
    Blogs.getById(27105).then (res) ->
      res.should.have.property('body')
    .should.be.fulfilled

  it 'getCommentsById() should return a json with the blog comments', ->
    Blogs.getCommentsById(1704).then (res) ->
      res.should.have.property('comments')
    .should.be.fulfilled

  it 'getFresh() should return a json with the freshest blogs data', ->
    Blogs.getFresh(rpp: 10).then (res) ->
      res.should.have.property('blog_posts')
      res.blog_posts.should.have.lengthOf(10)
    .should.be.fulfilled

  it 'getByUsername() should return a json with the blog data', ->
    Blogs.getByUsername(config.user_name).then (res) ->
      res.should.have.property('blog_posts')
    .should.be.fulfilled

  it 'getByUserId() should return a json with the blog data', ->
    Blogs.getByUserId(config.user_id).then (res) ->
      res.should.have.property('blog_posts')
    .should.be.fulfilled
