'use strict'

angular.module 'etimesheetApp'
.controller 'UserDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.user = $scope.$meteorObject User, $stateParams.userId
  $scope.$meteorSubscribe('user')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.user.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.user.reset()
