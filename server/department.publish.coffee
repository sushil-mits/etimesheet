'use strict'

Meteor.publish 'department', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted':0
  Counts.publish this, 'numberOfDepartment', Department.find({'deleted':0}), noReady: true
  Department.find where, options