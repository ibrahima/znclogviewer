angular.module('zncLogViewerApp')
  .factory "Networks", [ "$resource", ($resource) ->
    $resource("http://localhost:9292/users/:user/networks/:network/",
      {},
      logs:
        method: 'GET'
        isArray: true
        url: "http://localhost:9292/users/:user/networks/:network/logs"
      log:
        method: 'GET'
        url: "http://localhost:9292/users/:user/networks/:network/logs/:file"
    
    )
    ]
