'use strict'
require.config
  baseUrl: 'js'
  paths:
    'main': 'main'
    'socket': 'socket'
    'json3': '../components/json3/lib/json3'
    'jquery': '../components/jquery/jquery.min'
    'underscore': '../components/lodash/dist/lodash.compat'
    'angular': '../components/angular/angular.min'
    'ngRoute': '../components/angular-route/angular-routei.min'
    'ngAnimate': '../components/angular-animate/angular-animate.min'
    'topfriends.utils': 'topfriends/utils'
    'topfriends.error': 'topfriends/error'
    'topfriends.facebook': 'topfriends/facebook'
    'topfriends.topchat': 'topfriends/topchat'
    'bootstrap': '../components/bootstrap/dist/js/bootstrap'
    'bootstrap.dropdown': '../components/bootstrap/js/dropdown'
    'bootstrap.tooltip': '../components/bootstrap/js/tooltip'
    'facebook': '//connect.facebook.net/en_US/all'
    'pnotify': '../components/pnotify/jquery.pnotify'
    'translate': 'translate'
    'socket.io': '/socket.io/socket.io.js'
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
