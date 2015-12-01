'use strict'

angular.module 'etimesheetApp'
.controller 'DailyLogsListCtrl', ($scope, $meteor,$state ,$rootScope,$stateParams) ->
  $scope.page = 1
  $scope.perPage = 10
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  $scope.Times=[]
  
  $scope.dailyLogs = $scope.$meteorCollection () ->
    DailyLogs.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('dailyLogs', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.dailyLogsCount = $scope.$meteorObject Counts, 'numberOfDailyLogs', false

  $scope.projects = $scope.$meteorCollection () ->
    Project.find {"deleted":0 , "member": Meteor.userId()}
   
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project')

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users')

  $scope.projectD = $scope.$meteorCollection () ->
    Project.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project')

  console.log  $scope.project

  $meteor.session 'dailyLogsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newDailyLog=$scope.Times
      $scope.dailyLogs.save $scope.newDailyLog
      $scope.newDailyLog = undefined
      $scope.Times= undefined
      $scope.Times=[]
    $state.go 'dailyLog-detail'
    

  $scope.set=(name)->
    $scope.pname=name
    console.log($scope.pname)

  $scope.addRow=()->
    $scope.Times.push({pname:$scope.newDailyLog.name,Timetaken:$scope.newDailyLog.Timetaken,description:$scope.newDailyLog.Description,deleted:0,done:false,user:$rootScope.currentUser.emails[0].address,createdDate:new Date()})
    $scope.newDailyLog =""
    console.log($scope.pname)

  $scope.remove = (dailyLog) ->
    $scope.dailyLogs.remove dailyLog
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage

  $scope.find=(use,project,from,to)->
    $scope.dailyLogs = $scope.$meteorCollection () ->
      DailyLogs.find {'pname':project, 'user':use, 'createdDate':{$gt:from, $lt:to}}, {sort:$scope.getReactively('sort')}
    console.log($scope.dailyLogs)   
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
