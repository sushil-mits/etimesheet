'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectDetailCtrl',($scope, $meteor, $stateParams, $state, $mdToast) ->
  $scope.project = $scope.$meteorObject Project, $stateParams.projectId
  $scope.$meteorSubscribe('project')

  $scope.projects = $scope.$meteorCollection () ->
    Project.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('project')

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users')

  $scope.member=$scope.project.member
  $scope.idx=0

  $scope.shouldBeDisabled= (users)->
    if(users == '1')
      return true
    else
      return false
  
  
  $scope.exists=(users,list)->
    return list.indexOf(users) > -1

  $scope.toggle =  (users, list)->
    $scope.idx = list.indexOf(users)
    if($scope.idx > -1)
     list.splice($scope.idx, 1)
    else
     list.push(users)

  $scope.save = () ->
    if $scope.form.$valid
      $scope.project.member=$scope.member
      $scope.project.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
      
      $scope.member=[]
      $scope.idx=0 
    $mdToast.show($mdToast.simple().content('Datas Saved'));
    $state.go 'project-list'
        