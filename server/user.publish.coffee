'use strict'

Meteor.publish 'user', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfUser', User.find(where), noReady: true
  User.find where, options