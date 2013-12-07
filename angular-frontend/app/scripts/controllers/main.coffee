'use strict'

angular.module('zncLogViewerApp')
  .controller 'MainCtrl', ['$scope', '$anchorScroll', '$location', 'Users',
    ($scope, $anchorScroll, $location, Users) ->
      Users.query (response) ->
        $scope.users = response

       $scope.scrollTo = (id) ->
        $scope.active = id
  ]
