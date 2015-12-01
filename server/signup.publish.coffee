'use strict'

Meteor.publish 'signup', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfSignup', Signup.find(where), noReady: true
  Signup.find where, options