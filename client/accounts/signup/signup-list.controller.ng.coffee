'use strict'

angular.module 'etimesheetApp'
.controller 'SignupListCtrl', ( $scope,$meteor, $state, $mdToast) ->
  $scope.email= ''
  $scope.password=''
  $scope.error = ''
  $scope.newEmployee={
    fName:'',
    mName:'',
    lName:'',
    contact:{
      mNumber:'',
      hNumber:''
    }
    secondaryEmail:''
    address:'',
    role:'normal'   
    deleted: 0 ,
    isActive: 1
  }
  
  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {}

  $scope.save = () ->
    if($scope.password==$scope.rePassword)
      Accounts.createUser({email:$scope.email,password:$scope.password,profile:$scope.newEmployee},(error) ->
        if(error)
          console.log(error)
        else
          $scope.verification= $scope.user[0].emails[0].verified
          console.log("Verified Token send")
          $scope.emailToVerify = $scope.user[0].emails[0].address
          if($scope.verification==false)
           Meteor.call('chkEmailVerify',Meteor.userId(),$scope.emailToVerify)
           $state.go('login-list')
          else
            $state.go('admin-list')
        )
    else
      console.log("Password Mismatch")
      $mdToast.show($mdToast.simple().content('Password Mismatch'))
