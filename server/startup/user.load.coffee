Meteor.startup ->
  if User.find().count() == 0
    user = [
      {
        'name': 'user 1'
      }
      {
        'name': 'user 2'
      }
    ]
    user.forEach (user) ->
      User.insert user