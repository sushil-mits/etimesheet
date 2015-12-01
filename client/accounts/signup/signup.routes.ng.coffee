'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'signup-list',
    url: '/signup'
    templateUrl: 'client/accounts/signup/signup-list.view.html'
    controller: 'SignupListCtrl'
  .state 'signup-detail',
    url: '/signup/:signupId'
    templateUrl: 'client/accounts/signup/signup-detail.view.html'
    controller: 'SignupDetailCtrl'
