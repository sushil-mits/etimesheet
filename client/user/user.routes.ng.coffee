'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'user-list',
    url: '/user'
    templateUrl: 'client/user/user-list.view.html'
    controller: 'UserListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'user-detail',
    url: '/user/:userId'
    templateUrl: 'client/user/user-detail.view.html'
    controller: 'UserDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
