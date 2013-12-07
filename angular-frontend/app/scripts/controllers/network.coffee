'use strict'

angular.module('zncLogViewerApp')
  .controller 'NetworkCtrl', ['$scope', '$routeParams', 'Networks',
    ($scope, $routeParams, Networks) ->
      $scope.user = $routeParams.user
      $scope.network = $routeParams.network
      console.log $routeParams
      Networks.logs {user: $routeParams.user, network: $routeParams.network}, (response) ->
        $scope.logs = response
      if $routeParams.file
        Networks.log {user: $routeParams.user, network: $routeParams.network, file: $routeParams.file}, (response) ->
          $scope.log = response

  ]
