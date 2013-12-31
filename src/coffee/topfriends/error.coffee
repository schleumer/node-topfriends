define [
  'angular'
  'facebook'
], (angular, FB) ->
  topchat = angular.module('topfriends.error', [])
  topchat.controller 'ErrorController',
    ['$scope', '$http', 'socket', ($scope, $http, socket) ->
      $scope.init = ->
        return
      return
    ]