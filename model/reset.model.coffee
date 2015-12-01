@Reset = new Mongo.Collection('reset')

Reset.allow
  insert: (userId, reset) ->
    true
  update: (userId, reset, fields, modifier) ->
    true
  remove: (userId, reset) ->
    true
