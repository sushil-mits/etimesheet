Meteor.startup ->
  if LeaveRequest.find().count() == 0
    leaveRequest = [
      {
        'name': 'leaveRequest 1'
      }
      {
        'name': 'leaveRequest 2'
      }
    ]
    leaveRequest.forEach (leaveRequest) ->
      LeaveRequest.insert leaveRequest