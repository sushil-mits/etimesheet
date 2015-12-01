'use strict'

Meteor.publish 'designation', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted':0
  Counts.publish this, 'numberOfDesignation', Designation.find({'deleted':0}), noReady: true
  Designation.find where, options