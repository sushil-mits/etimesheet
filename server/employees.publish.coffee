'use strict'

Meteor.publish 'users', (options, searchString) ->
  where =
      'profile.fName':
        '$regex': '.*' + (searchString or '') + '.*'
        '$options': 'i'
      'profile.deleted' : 0 
  Counts.publish this, 'numberOfUsers', Meteor.users.find({'profile.deleted':0}), noReady: true
  Meteor.users.find where, options