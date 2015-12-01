'use strict'

angular.module 'etimesheetApp'
.controller 'ResetListCtrl', ($scope, $meteor) ->
  $scope.email= ''
  $scope.error = ''
  
  $scope.resetpsw = () ->
    console.log($scope.email)

    Accounts.forgotPassword({email:$scope.email}, (error)->
      if(error)
        console.log("this is erreorrrr")
        console.log(error+"this is error")
      else
        console.log('success')
        console.log($scope.email)
        $state.go 'login-list'
        
   )
    
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
