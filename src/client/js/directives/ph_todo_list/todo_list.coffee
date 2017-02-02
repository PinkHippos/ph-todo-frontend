module.exports = ->
  restrict: 'E'
  templateUrl: './js/directives/ph_todo_list/todo_list.html'
  scope:
    todos: '='
  controller: ($scope, todo_service)->
    _get_todos = ->
      todo_service.get_todos()
      .then (todos)->
        $scope.todos = todos
    $scope.apply_class = (status)->
      switch status
        when 'new' then 'panel-danger'
        when 'inProgress' then 'panel-warning'
        when 'complete' then 'panel-success'

    $scope.add_todo = (new_todo)->
      todo_service.add_todo new_todo
      .then ->
        _get_todos()
    $scope.advance_status = (todo_id, current_status)->
      next_status = switch current_status
        when 'new' then 'inProgress'
        when 'inProgress' then 'complete'
      updates =
        status: next_status
      $scope.update_todo todo_id, updates


    $scope.update_todo = (id, updated_todo)->
      todo_service.update_todo id, updated_todo
      .then ->
        _get_todos()
    $scope.delete_todo = (id)->
      todo_service.delete_todo id
      .then ->
        _get_todos()
