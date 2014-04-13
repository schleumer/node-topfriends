define [
  'angular'
  'facebook'
], (angular, FB) ->
  topchat = angular.module('topfriends.error', [])
  topchat.controller 'ErrorController',
    ['$scope', '$http', 'socket', '$location', ($scope, $http, socket, $location) ->
      $scope.message = null
      $scope.init = ->
        $scope.message = $location.search().message
        return
      return
    ]