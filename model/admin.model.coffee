@Admin = new Mongo.Collection('admin')

Admin.allow
  insert: (userId, admin) ->
    userId
  update: (userId, admin, fields, modifier) ->
    userId
  remove: (userId, admin) ->
    userId
