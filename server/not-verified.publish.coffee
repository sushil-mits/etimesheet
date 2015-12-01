'use strict'

Meteor.publish 'notVerified', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfNotVerified', NotVerified.find(where), noReady: true
  NotVerified.find where, options