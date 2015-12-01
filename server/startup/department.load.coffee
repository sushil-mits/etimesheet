Meteor.startup ->
  if Department.find().count() == 0
    department = [
      {
        'name': 'department 1'
      }
      {
        'name': 'department 2'
      }
    ]
    department.forEach (department) ->
      Department.insert department