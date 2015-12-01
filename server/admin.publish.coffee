'use strict'

Meteor.publish 'admin', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfAdmin', Admin.find(where), noReady: true
  Admin.find where, options