angular = require 'angular'
require 'angular-ui-router'

angular.module 'ph_todo', ['ui.router']
  .config ($urlRouterProvider, $stateProvider)->
    # Route to / with unrecognized url
    $urlRouterProvider.otherwise '/'
    # Set up all the states with $stateProvider
    require('./states') $stateProvider

require './controllers'
