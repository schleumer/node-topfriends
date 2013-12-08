define [
  'angular'
  'facebook'
], (angular, FB) ->
  utils = angular.module('topfriends.facebook', [])
  utils.directive 'topfriendsFacebook', () ->
    return link: (scope, element) ->
      element.click () ->
        FB.login((response) ->
          console.log('xd')
          return
          scope: 'email'
        )
      console.log('xd')
