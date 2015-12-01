@Designation = new Mongo.Collection('designation')

Designation.allow
  insert: (userId, designation) ->
    userId
  update: (userId, designation, fields, modifier) ->
    userId
  remove: (userId, designation) ->
    userId
