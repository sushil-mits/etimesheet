Meteor.startup ->
  if NotVerified.find().count() == 0
    notVerified = [
      {
        'name': 'notVerified 1'
      }
      {
        'name': 'notVerified 2'
      }
    ]
    notVerified.forEach (notVerified) ->
      NotVerified.insert notVerified