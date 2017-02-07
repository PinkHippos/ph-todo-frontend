angular = require 'angular'
require 'angular-ui-router'
require 'angular-ui-bootstrap'

angular.module 'ph_todo', ['ui.router', 'ui.bootstrap']
  .config ($httpProvider, $urlRouterProvider, $stateProvider)->
    # Handle for any errors we expect back from server
    $httpProvider.interceptors.push ($q)->
      responseError: (res)->
        switch res.status
          when 404
            console.warn 'Caught a 404 error'
            # Reject the promise and allow services to handle
            # any follow up actions
            $q.reject res
          else
            console.error 'Unhandled response error...'
            $q.reject res
    # Route to / with unrecognized url
    $urlRouterProvider.otherwise '/'
    # Set up all the states with $stateProvider
    require('./states') $stateProvider

require './components'
require './services'
require './controllers'
