@Department = new Mongo.Collection('department')

Department.allow
  insert: (userId, department) ->
    userId
  update: (userId, department, fields, modifier) ->
    userId
  remove: (userId, department) ->
    userId
