'use strict'

angular.module('zncLogViewerApp')
  .controller 'NetworkCtrl', ['$scope', '$routeParams', 'Users',
    ($scope, $routeParams, Users) ->
      Users.query (response) ->
        $scope.users = response
      $scope.network = $routeParams.network
  
  ]
