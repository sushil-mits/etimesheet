Meteor.startup ->
  if Designation.find().count() == 0
    designation = [
      {
        'name': 'designation 1'
      }
      {
        'name': 'designation 2'
      }
    ]
    designation.forEach (designation) ->
      Designation.insert designation