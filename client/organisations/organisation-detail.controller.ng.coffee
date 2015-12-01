'use strict'

angular.module 'etimesheetApp'
.controller 'OrganisationDetailCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.organisation = $scope.$meteorObject Organisations, $stateParams.organisationId
  $scope.$meteorSubscribe('organisations')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organisation.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
    $state.go 'organisations-list'
    
  $scope.reset = () ->
    $scope.organisation.reset()
]