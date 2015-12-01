'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'leaveRequest-list',
    url: '/leave-request'
    templateUrl: 'client/leave-request/leave-request-list.view.html'
    controller: 'LeaveRequestListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
  .state 'leaveRequest-detail',
    url: '/leave-requestDetail'
    templateUrl: 'client/leave-request/leave-request-detail.view.html'
    controller: 'LeaveRequestDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'leaveRequest',
    url: '/addleave'
    templateUrl: 'client/leave-request/leave-request.view.html'
    controller: 'LeaveRequestListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
