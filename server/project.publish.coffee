'use strict'

Meteor.publish 'project', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted':0
  Counts.publish this, 'numberOfProject', Project.find('deleted':0), noReady: true
  Project.find where, options