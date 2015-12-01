@Project = new Mongo.Collection('project')

Project.allow
  insert: (userId, project) ->
    userId
  update: (userId, project, fields, modifier) ->
    userId
  remove: (userId, project) ->
    userId
