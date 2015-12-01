@NotVerified = new Mongo.Collection('notVerified')

NotVerified.allow
  insert: (userId, notVerified) ->
    true
  update: (userId, notVerified, fields, modifier) ->
    true
  remove: (userId, notVerified) ->
    true
