module.exports =
  templateUrl: './js/directives/ph_todo_list/todo_list.html'
  bindings:
    todos: '<'
  controller: (todo_service)->
    ##### _get_todos #####
    # Gets all todos and assigns them to the component
    _get_todos = =>
      todo_service.get_todos()
      .then (todos)=>
        @todos = todos

    ##### apply_class #####
    # Applys a panel class based on status
    # @params: status -> string
    # @returns: string
    @apply_class = (status)->
      switch status
        when 'new' then 'panel-danger'
        when 'inProgress' then 'panel-warning'
        when 'complete' then 'panel-success'

    ##### add_todo #####
    # Calls todo_service with given todo
    # @params: new_todo -> {text: string}
    @add_todo = (new_todo)=>
      todo_service.add_todo new_todo
      .then =>
        @new_todo = null
        _get_todos()

    ##### advance_status #####
    # Gets the next status and updates the specified todo
    # @params: todo_id -> string
    # @params: current_status -> string
    @advance_status = (todo_id, current_status)=>
      next_status = switch current_status
        when 'new' then 'inProgress'
        when 'inProgress' then 'complete'
      updates =
        status: next_status
      @update_todo todo_id, updates

    ##### update_todo #####
    # Calls update_todo with todo_service and gets a fresh list of todos
    # @params: todo_id -> string
    # @params: update_todo -> object
    @update_todo = (id, updated_todo)=>
      todo_service.update_todo id, updated_todo
      .then =>
        @updated_todo = null
        _get_todos()

    ##### delete_todo #####
    # Calls todo_service.delete_todo and then gets fresh list of todos
    # @params: id -> string
    @delete_todo = (id)->
      todo_service.delete_todo id
      .then ->
        _get_todos()
