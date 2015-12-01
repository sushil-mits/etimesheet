@Organisations = new Mongo.Collection('organisations')

Organisations.allow
  insert: (userId, organisation) ->
    userId
  update: (userId, organisation, fields, modifier) ->
    userId
  remove: (userId, organisation) ->
    userId
