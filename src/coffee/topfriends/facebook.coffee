define [
  'angular'
  'facebook'
], (angular, FB) ->
  utils = angular.module('topfriends.facebook', [])
  utils.service('facebook', ['$http', ($http) ->
    return (
      login: (response, cb) ->
        console.log(response)
        data = {}
        if response.status is 'connected'
          $http(
           url:'/status'
           method: 'GET'
           params:
            from: 'facebook'
            token: response.authResponse.accessToken
          ).success((res) ->
            if res.data
              data.user = res.data
              data.authenticated = true
            cb(data)
            return
          )
    )
  ])

  utils.directive 'topfriendsFacebook', ['facebook', (facebook) ->
    return (
        require: 'ngModel'
        scope:
          ngModel: '='
          fbScope: '='
        link: (scope, element) ->
          element.click () ->
            FB.login(((response) ->
              facebook.login(response, (data) ->
                scope.ngModel.user = data.user
                scope.ngModel.authenticated = data.authenticated
                return
              )
              return
            ), scope: 'email')
      )
  ]
