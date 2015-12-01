@Signup = new Mongo.Collection('signup')

Signup.allow
  insert: (userId, signup) ->
    true
  update: (userId, signup, fields, modifier) ->
    true
  remove: (userId, signup) ->
    true
