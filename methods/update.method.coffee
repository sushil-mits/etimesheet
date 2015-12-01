'use strict'

Meteor.methods
  update: ( user,fName,mName,lName, mNumber, hNumber ,department, designation) ->
    Meteor.users.update({ _id: user },{$set:{"profile.fName":fName}})
    Meteor.users.update({ _id: user },{$set:{"profile.mName":mName}})
    Meteor.users.update({ _id: user },{$set:{"profile.lName":lName}})
    Meteor.users.update({ _id: user },{$set:{"profile.contact.mNumber":mNumber}})
    Meteor.users.update({ _id: user },{$set:{"profile.contact.hNumber":hNumber}})
    Meteor.users.update({ _id: user },{$set:{"profile.department":department}})
    Meteor.users.update({ _id: user },{$set:{"profile.designation":designation}})
    console.log ("Here i am to update user")
  delete: (user) ->
    Meteor.users.update({ _id: user },{$set:{"profile.deleted":1}})
    console.log("comes here to the method for delete")
    console.log(user)

  deactivate: (user) ->
    Meteor.users.update({ _id: user },{$set:{"profile.isActive":0}})
    console.log(user+"comes here to the method for deactivate")    

  organisationDelete:(organisation) ->
    Organisations.update({ _id:organisation },{$set:{'deleted':1}})

  organisationDeactivate:(organisation) ->
    Organisations.update({ _id:organisation },{$set:{'isActive':0}})

  departmentDelete:(department) ->
    Department.update({ _id:department },{$set:{'deleted':1}})

  departmentDeactivate:(department) ->
    Department.update({ _id:department },{$set:{'isActive':0}})

  designationDelete:(designation) ->
    Designation.update({ _id:designation },{$set:{'deleted':1}})

  designationDeactivate:(designation) ->
    Designation.update({ _id:designation },{$set:{'isActive':0}})


  leaveVerify:(leaveRequestid)->
    LeaveRequest.update(leaveRequestid,{$set:{'verified':"Approved"}})

  leaveCancel:(leaveRequestid)->
    LeaveRequest.update(leaveRequestid,{$set:{'verified':"Cancelled"}})
    
  leaveDelbyuser:(leaveRequestid)->
    LeaveRequest.update(leaveRequestid,{$set:{'deleted':1}})
    console.log("comes to the method")  
  
  Accounts.emailTemplates.resetPassword.text = (user, url) ->
    url = url.replace('#/','')
  Accounts.emailTemplates.verifyEmail.text = (user, url) ->
    url = url.replace('#/','')   
    