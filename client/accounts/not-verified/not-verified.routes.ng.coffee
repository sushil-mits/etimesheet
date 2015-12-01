'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'notVerified-list',
    url: '/not-verified'
    templateUrl: 'client/accounts/not-verified/not-verified-list.view.html'
    controller: 'NotVerifiedListCtrl'
  .state 'notVerified-detail',
    url: '/not-verified-state/'
    templateUrl: 'client/accounts/not-verified/not-verified-detail.view.html'
    controller: 'NotVerifiedDetailCtrl'
