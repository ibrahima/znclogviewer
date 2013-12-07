'use strict'

angular.module('zncLogViewerApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: '/views/main.html'
        controller: 'MainCtrl'
      .when '/users/:user/networks/:network',
        templateUrl: '/views/network.html'
        controller: 'NetworkCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(false).hashPrefix('!')

  ]

$(document).foundation()
