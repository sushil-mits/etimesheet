Meteor.startup ->
  if Signup.find().count() == 0
    signup = [
      {
        'name': 'signup 1'
      }
      {
        'name': 'signup 2'
      }
    ]
    signup.forEach (signup) ->
      Signup.insert signup