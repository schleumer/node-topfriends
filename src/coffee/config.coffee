'use strict'

__min = (file) ->
  if not window.devMode then (file + ".min")

require.config
  baseUrl: 'js'
  paths:
    'main': __min('main')
    'socket': __min('socket')
    'json3': __min('../components/json3/lib/json3')
    'jquery': __min('../components/jquery/dist/jquery')
    'underscore': __min('../components/lodash/dist/lodash.compat')
    'angular': __min('../components/angular/angular')
    'ngRoute': __min('../components/angular-route/angular-route')
    'ngAnimate': __min('../components/angular-animate/angular-animate')
    'topfriends.utils': __min('topfriends/utils')
    'topfriends.error': __min('topfriends/error')
    'topfriends.facebook': __min('topfriends/facebook')
    'topfriends.topchat': __min('topfriends/topchat')
    'bootstrap': __min('../components/bootstrap/dist/js/bootstrap')
    'bootstrap.dropdown': '../components/bootstrap/js/dropdown'
    'bootstrap.tooltip': '../components/bootstrap/js/tooltip'
    'facebook': '//connect.facebook.net/en_US/all'
    'pnotify': __min('../libs/pnotify/jquery.pnotify')
    'translate': __min('translate')
    'socket.io': __min('/socket.io/socket.io.js')
  shim:
    'underscore':
      deps: []
      exports: '_'
    'facebook':
      exports: 'FB'
    'pnotify':
      deps: [
        'jquery'
      ]
    'angular':
      deps: [
        'jquery',
        'underscore'
      ]
      exports: 'angular'
    'ngRoute':
      deps: [
        'angular'
      ]
    'ngAnimate':
      deps: [
        'angular'
      ]
    'bootstrap':
      deps: ['jquery']
    'bootstrap.dropdown':
      deps: ['jquery', 'bootstrap']
    'bootstrap.tooltip':
      deps: ['jquery', 'bootstrap']
  deps: [
    'translate'
    'main'
  ]
