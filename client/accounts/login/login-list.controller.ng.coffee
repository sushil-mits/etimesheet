'use strict'

angular.module 'etimesheetApp'
.controller 'LoginListCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.credentials =
    email: ''
    password: ''
  $scope.error = ''
  $scope.adminEmail="admin@admin.com"
  $scope.adminPassword="password"
  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {}
  
  $scope.login =() ->
    $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
      #$scope.loginRole=$scope.user[0].Role
      $scope.emailToVerify = $scope.user[0].emails[0].address
      #console.log($scope.loginRole)
      console.log($scope.user[0].emails[0].address)
      console.log($scope.user[0].emails[0].verified)
      if($scope.credentials.email==$scope.adminEmail && $scope.credentials.password==$scope.adminPassword)
        $state.go 'employees-list'
      else
        $scope.verificationState = $scope.user[0].emails[0].verified
        if($scope.verificationState==false)
          Meteor.call('chkEmailVerify',Meteor.userId(),$scope.emailToVerify)
          $state.go('notVerified-list',{userId: Meteor.userId()})
          console.log('not verified')
        else
          $state.go 'dailyLogs'
    ), (err) ->
      $scope.error = 'Login error - ' + err
]