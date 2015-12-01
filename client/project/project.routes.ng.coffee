'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'project-list',
    url: '/project'
    templateUrl: 'client/project/project-list.view.html'
    controller: 'ProjectListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
  .state 'project-detail',
    url: '/project/:projectId'
    templateUrl: 'client/project/project-detail.view.html'
    controller: 'ProjectDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  

  .state 'project',
    url: '/addproject'
    templateUrl: 'client/project/project.view.html'
    controller: 'ProjectListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
