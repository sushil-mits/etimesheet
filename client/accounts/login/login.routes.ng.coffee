'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'login-list',
    url: '/'
    templateUrl: 'client/accounts/login/login-list.view.html'
    controller: 'LoginListCtrl'
  .state 'login-detail',
    url: '/login/:loginId'
    templateUrl: 'client/accounts/login/login-detail.view.html'
    controller: 'LoginDetailCtrl'
  .state 'logout',
    url: '/logout'
    resolve:
      "logout": ['$meteor', '$state', ($meteor, $state) -> 
        return $meteor.logout().then( -> 
          $state.go('login-list');
        , (err) -> 
          console.log('logout error - ', err);
        )
      ]  
