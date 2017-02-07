module.exports =
  templateUrl: './js/components/ph_todo_list/todo_list.html'
  bindings:
    todos: '<'
  controller: (todo_service)->
    # Set flag for show and hide of edit form.
    @editing = false
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
