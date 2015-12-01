'use strict'

angular.module 'etimesheetApp'
.controller 'SignupDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.signup = $scope.$meteorObject Signup, $stateParams.signupId
  $scope.$meteorSubscribe('signup')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.signup.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.signup.reset()
