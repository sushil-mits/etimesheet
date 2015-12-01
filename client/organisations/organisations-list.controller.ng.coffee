'use strict'

angular.module 'etimesheetApp'
.controller 'OrganisationsListCtrl',['$scope', '$meteor','$stateParams', '$state', ($scope, $meteor, $stateParams, $state) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.organisations = $scope.$meteorCollection () ->
    Organisations.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('organisations', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.organisationsCount = $scope.$meteorObject Counts, 'numberOfOrganisations', false

  $meteor.session 'organisationsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newOrganisation.deleted=0
      $scope.newOrganisation.isActive=1
      $scope.organisations.save $scope.newOrganisation
      $scope.newOrganisation = undefined
    $state.go 'organisations-list'

  $scope.remove = (organisation) ->
    Meteor.call('organisationDelete', organisation)
  
  $scope.deactivate = (organisation) ->
    Meteor.call('oragnisationDeactivate', organisation)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
]