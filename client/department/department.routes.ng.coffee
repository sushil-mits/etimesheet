'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'department-list',
    url: '/department'
    templateUrl: 'client/department/department-list.view.html'
    controller: 'DepartmentListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
  .state 'department-detail',
    url: '/department/:departmentId'
    templateUrl: 'client/department/department-detail.view.html'
    controller: 'DepartmentDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  

  .state 'department',
    url: '/add-department'
    templateUrl: 'client/department/department.view.html'
    controller: 'DepartmentListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.emails[0].address=="admin@admin.com")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  
