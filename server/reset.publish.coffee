'use strict'

Meteor.publish 'reset', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfReset', Reset.find(where), noReady: true
  Reset.find where, options