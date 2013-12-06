'use strict'
require.config
  baseUrl: 'js'
  paths:
    'main': 'main'
    'json3': '../components/json3/lib/json3'
    'jquery': '../components/jquery/jquery'
    'underscore': '../components/lodash/dist/lodash.compat'
    'angular': '../components/angular/angular'
    'ngRoute': '../components/angular-route/angular-route'
    'angular.topfriends.utils': 'topfriends'
    'bootstrap': '../components/bootstrap/dist/js/bootstrap'
    'bootstrap.dropdown': '../components/bootstrap/js/dropdown'
  shim:
    'underscore':
      deps: []
      exports: '_'
    'angular':
      deps: [
        'jquery', 'underscore'
      ]
      exports: 'angular'
    'ngRoute':
      deps: [
        'angular'
      ]
    'bootstrap':
      deps: ['jquery']
    'bootstrap.dropdown':
      deps: ['jquery', 'bootstrap']
  deps: ['main']