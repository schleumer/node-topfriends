require [
  'angular'
  'facebook'
  'ngRoute'
  'topfriends.utils'
  'topfriends.facebook'
], (angular, FB) ->
  FB.init appId : '242235712573248'
  FB.getLoginStatus (response) ->
    console.log(response)

  app = angular.module 'Topfriends', [
    'topfriends.utils'
    'topfriends.facebook'
    'ngRoute'
  ]

  app.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $locationProvider.hashPrefix '!'
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
