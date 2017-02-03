module.exports = ->
  restrict: 'E'
  templateUrl: './js/directives/ph_todo_nav/nav.html'
  controller: ($scope)->
    $scope.nav_test = 'This is the nav directive test'
