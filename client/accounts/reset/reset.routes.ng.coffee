'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'reset-list',
    url: '/reset'
    templateUrl: 'client/accounts/reset/reset-list.view.html'
    controller: 'ResetListCtrl'
  .state 'reset-detail',
    url: '/resetCustome'
    templateUrl: 'client/accounts/reset/reset-detail.view.html'
    controller: 'ResetDetailCtrl'
  .state 'resetadmin',
    url: '/reset/:userId'
    templateUrl: 'client/accounts/reset/resetadmin.view.html'
    controller: 'ResetDetailCtrl'
