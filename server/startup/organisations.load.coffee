Meteor.startup ->
  if Organisations.find().count() == 0
    organisations = [
      {
        'name': 'organisation 1'
      }
      {
        'name': 'organisation 2'
      }
    ]
    organisations.forEach (organisation) ->
      Organisations.insert organisation