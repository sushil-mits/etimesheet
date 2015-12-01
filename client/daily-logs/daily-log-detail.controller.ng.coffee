'use strict'

angular.module 'etimesheetApp'
.controller 'DailyLogDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.dailyLog = $scope.$meteorObject DailyLogs, $stateParams.dailyLogId
  $scope.$meteorSubscribe('dailyLogs')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.dailyLog.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.dailyLog.reset()
