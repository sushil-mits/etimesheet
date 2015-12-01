'use strict'

Meteor.publish 'resetPassword', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfResetPassword', ResetPassword.find(where), noReady: true
  ResetPassword.find where, options