Meteor.startup ->
  if Meteor.users.find().count() == 0
    Accounts.createUser({
      email: 'admin@admin.com'
      password: 'password'
      stopActivationLink : true
    })
    Accounts.createUser({
      email: 'sushil@makeitsimple.info'
      password: 'password'
      profile:{
        fName:'Sushil',
        mName:'',
        lName:'Thapa'
        contact:{
          mNumber:''
          hNumber:''
        },
        secondaryEmail:'',
        deleted:0,
        isActive:1
      }
      stopActivationLink : true
    })

  Accounts.onCreateUser (options, user) ->
    if options.stopActivationLink
      user.emails[0].verified=true   
    user.profile=options.profile
    return user

