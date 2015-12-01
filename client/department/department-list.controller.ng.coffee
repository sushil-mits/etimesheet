'use strict'

angular.module 'etimesheetApp'
.controller 'DepartmentListCtrl', ['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.department = $scope.$meteorCollection () ->
    Department.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('department', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.departmentCount = $scope.$meteorObject Counts, 'numberOfDepartment', false

  $meteor.session 'departmentCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newDepartment.deleted = 0
      $scope.newDepartment.isActive = 0
      $scope.department.save $scope.newDepartment
      $scope.newDepartment = undefined
    $state.go 'department-list'
  $scope.remove = (department) ->
    Meteor.call('departmentDelete', department)

  $scope.deactivate = (department) ->
    Meteor.call('departmentDeactivate', organisation)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]
