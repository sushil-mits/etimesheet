'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'designation-list',
    url: '/designation'
    templateUrl: 'client/designation/designation-list.view.html'
    controller: 'DesignationListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
  .state 'designation-detail',
    url: '/designation/:designationId'
    templateUrl: 'client/designation/designation-detail.view.html'
    controller: 'DesignationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  

  .state 'designation',
    url: '/add-designation'
    templateUrl: 'client/designation/designation.view.html'
    controller: 'DesignationListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  