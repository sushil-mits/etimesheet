'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'dailyLogs-list',
    url: '/daily-logs'
    templateUrl: 'client/daily-logs/daily-logs-list.view.html'
    controller: 'DailyLogsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ] 
  .state 'dailyLog-detail',
    url: '/dailylogs-de'
    templateUrl: 'client/daily-logs/daily-log-detail.view.html'
    controller: 'DailyLogDetailCtrl'
    resolve:
      currentUser: ['$meteor','$state', ($meteor,$state) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].verified==true && user.emails[0].isActive==1)
             return true
          else
            $state.go('not-verified')
          )
      ]
  .state 'dailyLogs',
    url: '/add-dailyLogs'
    templateUrl: 'client/daily-logs/daily-log.view.html'
    controller: 'DailyLogsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
