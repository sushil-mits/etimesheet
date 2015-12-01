'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin-list',
    url: '/admin'
    templateUrl: 'client/admin/admin-list.view.html'
    controller: 'AdminListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'admin-detail',
    url: '/admin/:adminId'
    templateUrl: 'client/admin/admin-detail.view.html'
    controller: 'AdminDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
