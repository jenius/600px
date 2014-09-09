node-500px
==========

[![NPM version](https://badge.fury.io/js/500px.png)](http://badge.fury.io/js/500px)

This plugin is a wrapper for the [500px.com](http://500px.com) API. For more details on what the API offers, check out [developer.500px.com](http://developer.500px.com/).

## Install

The easiest way is to install through npm:

```bash
$ npm install 500px
```

Of course you can also clone via git or download the .zip or .tar.gz via the links above.

## Getting started

Include the module in your project and initialize it. **Important**: Use the consumer key provided by 500px, not the JavaScript SDK key, as that is different!

```javascript
var API500px = require('500px'),
    api500px = new API500px({ consumer_key: 'xxx' });
```

Now you are ready to make some calls to the 500px.com API!

## GET photos

To retrieve photos, try the following code:

```javascript
api500px.photos.getPopular({'sort': 'created_at', 'rpp': '100'})
  .catch(console.error)
  .then(console.log);
```

Note that each method returns a A+ compliant promise generated by [when.js](https://github.com/cujojs/when). If you don't know how to use promises, don't worry at all, the basics are super easy. You can just follow the example as above: use `then` to execute a function on success and `catch` on error. Below are all the photo-related functions you can use:

* `getById (photo_id, arguments)`
* `getByUsername (username, arguments)`
* `getByUserId (user_id, arguments)`
* `getFavoritesByUsername (username, arguments)`
* `getFavoritesByUserId (user_id, arguments)`
* `getFriendsByUsername (username, arguments)`
* `getFriendsByUserId (user_id, arguments)`
* `getPopular (arguments)`
* `getUpcoming (arguments)`
* `getEditorsChoice (arguments)`
* `getFreshToday (arguments)`
* `getFreshYesterday (arguments)`
* `getFreshWeek (arguments)`
* `searchByTag (tag, arguments)`
* `searchByTerm (term, arguments)`

For more information on the possible arguments, please check the [500px.com photos API](http://developer.500px.com/docs/photos-index)

## GET users

To retrieve users, try the following code:

```javascript
api500px.users.getById(1234)
  .catch(console.error)
  .then(console.log);
```

Choose one of the funtions to get users (arguments optional):

* `getById (id, arguments)`
* `getByName (username, arguments)`
* `getByEmail (email, arguments)`
* `getFriendsById (id, arguments)`

For more information on the possible arguments, please check the [500px.com users API](http://developer.500px.com/docs/users-index)

## GET blogs

To retrieve blogs, try the following code:

```javascript
api500px.blogs.getFresh()
  .catch(console.error)
  .then(console.log);
```

Choose one of the funtions to get blogs (arguments optional):

* `getById (id, arguments)`
* `getCommentsById (id, arguments)`
* `getFresh (arguments)`
* `getByUsername (username, arguments)`
* `getByUserId (user_id, arguments)`

For more information on the possible arguments, please check the [500px.com blogs API](http://developer.500px.com/docs/blogs-index)

## LICENSE

Licensed under MIT ([see license »](LICENSE))
