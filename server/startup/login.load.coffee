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
        deleted:0,
        isActive:1
      }
      stopActivationLink : true
    })

  
