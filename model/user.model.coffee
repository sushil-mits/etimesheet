@User = new Mongo.Collection('user')

User.allow
  insert: (userId, user) ->
    userId
  update: (userId, user, fields, modifier) ->
    userId
  remove: (userId, user) ->
    userId
