'use strict'

angular.module 'etimesheetApp'
.controller 'NotVerifiedDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.notVerified = $scope.$meteorObject NotVerified, $stateParams.notVerifiedId
  $scope.$meteorSubscribe('notVerified')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.notVerified.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.notVerified.reset()
