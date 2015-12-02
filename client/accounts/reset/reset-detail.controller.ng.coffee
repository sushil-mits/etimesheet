'use strict'

angular.module 'etimesheetApp'
.controller 'ResetDetailCtrl', ($scope, $meteor, $state,$stateParams) ->
  $scope.credentials = email: ''
  $scope.error = ''
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  $scope.email=$scope.users[0].emails[0].address

  $scope.aresetpsw = () ->
     console.log($stateParams.userId)
     Meteor.call('resetpsw', $stateParams.userId,$scope.newPlaintextPassword)
     console.log("successfromcontroller")

  # $scope.resetpsw = () ->
  #   Meteor.call('resetPassword',$stateParams.resetToken,$scope.password)