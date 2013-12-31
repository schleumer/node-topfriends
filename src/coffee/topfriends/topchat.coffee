define [
  'angular'
  'facebook'
], (angular, FB) ->
  topchat = angular.module('topfriends.topchat', [])
  topchat.controller 'TopChatController',
    ['$scope', '$http', 'socket', ($scope, $http, socket) ->
      $scope.threads = []
      $scope.status = __('Aguarde...')
      $scope.settings = {
        tag: false,
        share: true
      }
      io = socket()
      $scope.init = ->
        io.on('session', (session) ->
          $scope.threads = []
          io.on('topchat:threads:status', (data) ->
            $scope.status = data
          )
          io.on('topchat:threads:data', (data) ->
            $scope.threads = data
          )
          io.emit('topchat:threads')
        )
      return
      return
    ]