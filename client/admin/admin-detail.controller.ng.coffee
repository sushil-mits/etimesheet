'use strict'

angular.module 'etimesheetApp'
.controller 'AdminDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.admin = $scope.$meteorObject Admin, $stateParams.adminId
  $scope.$meteorSubscribe('admin')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.admin.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.admin.reset()
