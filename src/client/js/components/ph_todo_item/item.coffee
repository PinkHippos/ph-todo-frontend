module.exports =
  bindings:
    item: '='
  templateUrl: './js/components/ph_todo_item/item.html'
  controller: (todo_service)->
    @editing = false
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
      @editing = false
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
