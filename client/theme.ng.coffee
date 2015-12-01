'use strict'

angular.module 'etimesheetApp'
.config ($mdThemingProvider) ->
  $mdThemingProvider.theme('default')
  .primaryPalette('grey')
  .accentPalette('blue-grey')
