'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectListCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.member=[]
  $scope.page = 1
  $scope.perPage = 10
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  $scope.switch= false
  
  $scope.project = $scope.$meteorCollection () ->
    Project.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.projectCount = $scope.$meteorObject Counts, 'numberOfProject', false

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users')

  $meteor.session 'projectCounter'
  .bind $scope, 'page'


  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false
  
  $scope.exist=(users,list)->
    return list.indexOf(users) > -1

  $scope.toggle =  (users, list)->
    $scope.idx = list.indexOf(users)
    if($scope.idx > -1)
      list.splice($scope.idx, 1)
    else
      console.log users
      list.push(users)

    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newProject.deleted=0
      $scope.newProject.isActive=1
      $scope.newProject.member=$scope.member
      $scope.project.save $scope.newProject

      $scope.newProject = undefined
      $scope.member=[]
      $scope.idx=0 
      
    $state.go 'project-list'
   
  


 

  $scope.remove = (project) ->
    $scope.project.remove project
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]