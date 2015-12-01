'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'organisations-list',
    url: '/organisations'
    templateUrl: 'client/organisations/organisations-list.view.html'
    controller: 'OrganisationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
  .state 'organisation-detail',
    url: '/organisations/:organisationId'
    templateUrl: 'client/organisations/organisation-detail.view.html'
    controller: 'OrganisationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  

  .state 'organisation',
    url: '/addorganisations'
    templateUrl: 'client/organisations/organisation.view.html'
    controller: 'OrganisationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
