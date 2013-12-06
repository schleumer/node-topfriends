require [
  'angular'
  'ngRoute'
  'angular.topfriends.utils'
], (angular) ->
  app = angular.module 'Topfriends', [
    'angular.topfriends.utils'
    'ngRoute'
  ]

  app.config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when('/index', {
      templateUrl: 'templates/index',
      controller: 'IndexController'
    }).otherwise({
      redirectTo: '/index'
    })
  ]

  app.run ->
    return

  app.controller 'MainController', ['$scope', ($scope) ->
  ]

  app.controller 'IndexController', ['$scope', ($scope) ->

  ]

  $(() ->
    angular.bootstrap(document, ['Topfriends'])
  )
  return