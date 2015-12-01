Meteor.startup ->
  if Project.find().count() == 0
    project = [
      {
        'name': 'project 1'
      }
      {
        'name': 'project 2'
      }
    ]
    project.forEach (project) ->
      Project.insert project