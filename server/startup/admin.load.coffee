Meteor.startup ->
  if Admin.find().count() == 0
    admin = [
      {
        'name': 'admin 1'
      }
      {
        'name': 'admin 2'
      }
    ]
    admin.forEach (admin) ->
      Admin.insert admin