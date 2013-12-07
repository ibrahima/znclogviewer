angular.module('zncLogViewerApp')
    .factory "Users", [ "$resource", ($resource) ->
      $resource("http://localhost:9292/users/:user")
    ]
