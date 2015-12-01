'use strict'

angular.module 'etimesheetApp'
.controller 'DesignationListCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.designation = $scope.$meteorCollection () ->
    Designation.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designation', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.designationCount = $scope.$meteorObject Counts, 'numberOfDesignation', false

  $meteor.session 'designationCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newDesignation.deleted = 0
      $scope.newDesignation.isActive = 1
      $scope.designation.save $scope.newDesignation
      $scope.newDesignation = undefined
    $state.go 'designation-list'
  $scope.remove = (designation) ->
    Meteor.call('designationDelete',designation)
  $scope.deactivate = (designation) -> 
    Meteor.call('designationDeactivate',designation)   
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]