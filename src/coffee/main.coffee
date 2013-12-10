require [
  'angular'
  'facebook'
  'underscore'
  'ngRoute'
  'topfriends.utils'
  'topfriends.facebook'
], (angular, FB, _) ->
  FB.init appId : '242235712573248'

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

  app.run ['$rootScope', '$http', 'facebook', ($rootScope, $http, facebook) ->
    $rootScope.loginStatus = -1
    $rootScope.user = null
    $rootScope.authenticated = false
    if angular.element('#session').length
      session = JSON.parse(angular.element('#session').val())
      if session
        $rootScope.user = session
        $rootScope.authenticated = true
    else
      FB.getLoginStatus (response) ->
        facebook.login(response, (data) ->
          if data
            $rootScope.user = data.user
            $rootScope.authenticated = data.authenticated
          return
        )
    return
  ]

  app.controller 'MainController', ['$scope', ($scope) ->
  ]

  app.controller 'IndexController', ['$scope', ($scope) ->

  ]

  $(() ->
    angular.bootstrap(document, ['Topfriends'])
  )
  return
