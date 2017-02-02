module.exports = ->
  restrict: 'E'
  templateUrl: './js/directives/ph_todo_list/todo_list.html'
  scope:
    todos: '='
  controller: ($scope, todo_service)->
    $scope.apply_class = (status)->
      switch status
        when 'new' then 'panel-danger'
        when 'inProgress' then 'panel-warning'
        when 'complete' then 'panel-success'
    $scope.add_todo = (new_todo)->
      todo_service.add_todo new_todo
      .then ->
        todo_service.get_todos()
        .then (todos)->
          $scope.todos = todos
    $scope.update_todo = (id, updated_todo)->
      todo_service.update_todo id, updated_todo
    $scope.delete_todo = (id)->
      todo_service.delete_todo id
