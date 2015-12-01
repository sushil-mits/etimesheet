'use strict'

angular.module 'etimesheetApp'
.controller 'DepartmentDetailCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.department = $scope.$meteorObject Department, $stateParams.departmentId
  $scope.$meteorSubscribe('department')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.department.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
    $state.go 'department-list'
        
  $scope.reset = () ->
    $scope.department.reset()
]