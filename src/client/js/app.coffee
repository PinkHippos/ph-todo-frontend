angular = require 'angular'
require 'angular-ui-router'
require 'angular-ui-bootstrap'

angular.module 'ph_todo', ['ui.router', 'ui.bootstrap']
  .config ($urlRouterProvider, $stateProvider)->
    # Route to / with unrecognized url
    $urlRouterProvider.otherwise '/'
    # Set up all the states with $stateProvider
    require('./states') $stateProvider

require './directives'
require './services'
require './controllers'
