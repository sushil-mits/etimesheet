Meteor.startup ->
  if Reset.find().count() == 0
    reset = [
      {
        'name': 'reset 1'
      }
      {
        'name': 'reset 2'
      }
    ]
    reset.forEach (reset) ->
      Reset.insert reset