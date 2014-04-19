define [
  'angular'
  'facebook'
], (angular, FB) ->
  topchat = angular.module('topfriends.topchat', [])
  topchat.controller 'TopChatController',
    ['$scope', '$http', 'socket', ($scope, $http, socket) ->
      $scope.threads = []
      $scope.status = __('Aguarde...')
      $scope.name_search = ""
      $scope.toTag = []
      $scope.maxUsers = 10
      $scope.settings = {
        tag: false,
        share: true
      }
      io = socket()
      $scope.filterIt = (it) ->
        console.log($scope.name_search)
        if not $scope.name_search
          return true
        false
      $scope.makeIt = ->
        console.log 'xd'
        io.emit("topchat:makeIt", {
           toTag: $scope.toTag,
           maxUsers: $scope.maxUsers
        })
      $scope.init = ->
        io.on('session', (session) ->
          $scope.threads = []
          io.on('topchat:threads:status', (data) ->
            $scope.status = data
          )
          io.on('topchat:threads:data', (data) ->
            $scope.threads = data
            $scope.toTag = $scope.threads.slice(0, 10)
          )
          io.emit('topchat:threads')
        )
      return
      return
    ]
