600px
=====

[![npm](http://img.shields.io/npm/v/600px.svg?style=flat)](https://badge.fury.io/js/600px) [![dependencies](http://img.shields.io/gemnasium/jenius/600px.svg?style=flat)](https://gemnasium.com/jenius/600px)
<!-- Need some auth wizardry to get these on travis -->
<!-- [![tests](http://img.shields.io/travis/jenius/600px/master.svg?style=flat)](https://travis-ci.org/jenius/600px) [![Coverage Status](https://img.shields.io/coveralls/jenius/600px.svg?style=flat)](https://coveralls.io/r/jenius/600px?branch=master) -->

A [500px.com](http://500px.com) wrapper that does a little more than the existing `500px` node module :wink:. Wraps the [500px API](http://developer.500px.com/), exposing a clean, well-tested, promise-based interface with support for authenticated requests.

### Installation

```sh
$ npm install 600px
```

### Usage

Require it into your project as usual. The main module is a class that requires a configuration object to be correctly initialized. You need a `consumer_key` for the public methods, and a bit more information for the authenticated methods, which we'll talk about in the next section.

```js
var API = require('600px'),
    api = new API({ consumer_key: 'xxx' });
```

Now you have an object available for each API endpoint, as such:

```js
var Photos = api.photos;
var Users = api.users;
var Blogs = api.blogs;
var Collections = api.collections;
```

There are a number of methods to make specific API requests on each of these endpoints, documented below. At the moment, only `GET` methods are supported, although I plan on adding support for `POST` and `PUT` methods down the line as well, and the architecture is in place for it.

### Authorization

This library is intended for personal use and therefore does not include a full authorization flow. If you do need to authorize, it has to happen in the browser through OAuth, and you can use the officially maintained [500px client-side js library](https://github.com/500px/500px-js-sdk) for this.

Unfortunately, 500px offers no way for you to easily obtain a personal access token, so you need to go through the whole OAuth thing and make a dummy app in order to get the info you need to make authenticated requests. Here are a set of steps you can take to get personal access tokens fairly painlessly:

- Make a [new 500px application](https://500px.com/settings/applications), make sure to set the callback url to `https://grant-oauth.herokuapp.com/connect/500px/callback`.
- Head over to the wonderful [grant oauth playground](https://grant-oauth.herokuapp.com/#500px), check the `app` box, and enter in your application's consumer key and secret which you just generated
- Go through the oauth flow. At the end, you will be redirected to grant's playground where you will get a access token and access secret.
- In order to make authenticated calls, you need a `consumer_key`, `consumer_secret`, `token`, and `token_secret`, which you now have all of. Initialize this library's class with those four, named appropriately, and you will be able to make authenticated calls.

With this done, you can hit any endpoint without errors. Without this in place, the endpoints that indicate that they require OAuth in [500px's API docs](https://github.com/500px/api-documentation) will return an error.

### Photos

To retrieve photos, use `photos` on the instantiated class with any of the methods listed below. A brief example:

```javascript
api.photos.getPopular({'sort': 'created_at', 'rpp': '100'})
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

### Users

Example:

```javascript
api.users.getById(1234)
  .catch(console.error)
  .then(console.log);
```

Available functions:

* `get (arguments)`
* `getById (id, arguments)`
* `getByName (username, arguments)`
* `getByEmail (email, arguments)`
* `getFriendsById (id, arguments)`

For more information on the possible arguments, please check the [500px.com users API](http://developer.500px.com/docs/users-index)

### Blogs

Example:

```javascript
api.blogs.getFresh()
  .catch(console.error)
  .then(console.log);
```

Functions:

* `getById (id, arguments)`
* `getCommentsById (id, arguments)`
* `getFresh (arguments)`
* `getByUsername (username, arguments)`
* `getByUserId (user_id, arguments)`

For more information on the possible arguments, please check the [500px.com blogs API](http://developer.500px.com/docs/blogs-index)

### Collections

Note that all collections endpoints require full authentication credentials.

Example:

```javascript
api.collections.get()
  .catch(console.error)
  .then(console.log);
```

Functions:

* `get (arguments)`
* `getById (id, arguments)`

For more information on the possible arguments, please check the [500px.com collections API](http://developer.500px.com/docs/collections-index)

### License

Licensed under MIT ([see license »](LICENSE))
