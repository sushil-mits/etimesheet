'use strict'

angular.module 'etimesheetApp'
.controller 'EmployeeDetailCtrl', ['$scope', '$meteor','$stateParams', '$state','$mdToast', ($scope, $meteor, $stateParams, $state, $mdToast) ->
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  #console.log($scope.users)
  $scope.fName= $scope.users[0].profile.fName
  $scope.mName= $scope.users[0].profile.mName
  $scope.lName= $scope.users[0].profile.lName
  $scope.lName= $scope.users[0].profile.lName
  $scope.mNumber= $scope.users[0].profile.contact.mNumber
  $scope.hNumber= $scope.users[0].profile.contact.hNumber 
  $scope.department= $scope.users[0].profile.department 
  $scope.designation= $scope.users[0].profile.designation


  console.log($scope.fName)
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('users') 

  $scope.designation = $scope.$meteorCollection () ->
    Designation.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designation')
  
  
  $scope.department = $scope.$meteorCollection () ->
    Department.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  
  $meteor.autorun $scope, () -> 
    $scope.$meteorSubscribe('department')


  $scope.save = () ->
    Meteor.call('update', $stateParams.userId,  $scope.fName, $scope.mName, $scope.lName, $scope.mNumber, $scope.hNumber ,$scope.department, $scope.designation)
    console.log($scope.fName)
    $mdToast.show($mdToast.simple().content('Datas Saved'));
    $state.go 'employees-list'
        
  $scope.reset = () ->
    $scope.employee.reset()
]