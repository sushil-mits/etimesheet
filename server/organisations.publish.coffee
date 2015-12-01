'use strict'

Meteor.publish 'organisations', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted': 0
  Counts.publish this, 'numberOfOrganisations', Organisations.find({'deleted':0}), noReady: true
  Organisations.find where, options