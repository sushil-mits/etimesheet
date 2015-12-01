'use strict'

angular.module 'etimesheetApp'
.controller 'LeaveRequestListCtrl', ($scope, $meteor,$state) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.leaveRequest = $scope.$meteorCollection () ->
    LeaveRequest.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequest', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.leaveRequestCount = $scope.$meteorObject Counts, 'numberOfLeaveRequest', false

  $scope.leave =$scope.$meteorCollection () ->
    LeaveRequest.find { 'verified':"Not-Approved"} 
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('leaveRequestsadmin')

  $meteor.session 'leaveRequestCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newLeaveRequest.verified="Not-Approved"
      $scope.newLeaveRequest.askDate=new Date()
      $scope.newLeaveRequest.owner=Meteor.userId()
      $scope.newLeaveRequest.startDate= $scope.startDate
      $scope.newLeaveRequest.endDate= $scope.endDate
      $scope.newLeaveRequest.user= $scope.currentUser.emails[0].address
      $scope.newLeaveRequest.deleted=0
      $scope.leaveRequest.save $scope.newLeaveRequest
      $scope.newLeaveRequest = undefined
    $state.go 'leaveRequest-detail'
  
  $scope.remove = (leaveRequest) ->
    $scope.leaveRequest.remove leaveRequest
  
  $scope.verifyleave = (leaveRequestid) ->
    console.log('comes to controer of admin leave')
    Meteor.call('leaveVerify', leaveRequestid)

  $scope.cancelleave = (leaveRequestid) ->
    console.log('comes to controer of admin leave')
    Meteor.call('leaveCancel', leaveRequestid)  

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
