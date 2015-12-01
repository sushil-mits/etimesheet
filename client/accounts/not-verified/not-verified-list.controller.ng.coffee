'use strict'

angular.module 'etimesheetApp'
.controller 'NotVerifiedListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.notVerified = $scope.$meteorCollection () ->
    NotVerified.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('notVerified', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.notVerifiedCount = $scope.$meteorObject Counts, 'numberOfNotVerified', false

  $meteor.session 'notVerifiedCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.notVerified.save $scope.newNotVerified
      $scope.newNotVerified = undefined
      
  $scope.remove = (notVerified) ->
    $scope.notVerified.remove notVerified
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
