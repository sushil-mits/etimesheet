'use strict'

Meteor.publish 'leaveRequest', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted':0
  Counts.publish this, 'numberOfLeaveRequest', LeaveRequest.find({'deleted':0}), noReady: true
  LeaveRequest.find where, options


Meteor.publish 'leaveRequestsadmin', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'verified': "Not-Approved"
  Counts.publish this, 'numberOfLeaveRequests', LeaveRequest.find({verified:"Not-Approved"}), noReady: true
  LeaveRequest.find where, options   