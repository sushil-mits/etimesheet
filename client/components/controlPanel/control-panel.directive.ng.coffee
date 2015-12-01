'use strict'

angular.module 'etimesheetApp'
.directive 'controlPanel', ->
  restrict: 'EA'
  templateUrl: 'client/components/controlPanel/control-panel.view.html'
  replace: true
  link: (scope, elem, attrs) ->
    scope.property = 'controlPanel'
