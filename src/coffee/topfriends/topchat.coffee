define [
  'angular'
  'facebook'
], (angular, FB) ->
  topchat = angular.module('topfriends.topchat', [])
  topchat.controller 'TopChatController', () ->
    $scope.xd = 'lel'
