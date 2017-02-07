module.exports =
  templateUrl: './js/components/ph_todo_nav/nav.html'
  controller: ($scope, todo_service)->
    $scope.add_todo = (new_todo)->
      todo_service.add_todo new_todo
      .then ->
        $scope.nav_todo = null
