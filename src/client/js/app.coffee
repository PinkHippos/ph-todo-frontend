require 'jquery'
require 'bootstrap'
angular = require 'angular'
require 'angular-ui-router'
require 'angular-ui-bootstrap'

angular.module 'ph_todo', ['ui.router', 'ui.bootstrap']
  .config ($httpProvider, $urlRouterProvider, $stateProvider)->
    # Push on interceptors to handle for error codes.
    $httpProvider.interceptors.push ($q)->
      responseError: (res)->
        if res.status is 404
          $q.reject res
        else
          console.warn 'Unhandled response error...'
          $q.reject res
    # Route to / with unrecognized url
    $urlRouterProvider.otherwise '/'
    # Set up all the states with $stateProvider
    require('./states') $stateProvider

require './directives'
require './services'
require './controllers'
