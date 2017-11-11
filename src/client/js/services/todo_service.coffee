_format_query = (query)->
  formatted = ''
  first = true
  # Loop over the query object
  for key, val of query
    if first
      # If it's the first value prepend the '?'
      formatted += "?#{key}=#{val}"
      first = false
    else
      formatted += "&#{key}=#{val}"
  # return the formatted query string
  formatted
new class TodoService
  # Values here can be used only by the TodoService itself
  # Use 'this.***' or '@***' and make sure the fn is bound with '=>'
  url: 'api/todos'

  # Functions in here are exposed to the angular app
  constructor: ($http, $q)->
    ##### get_todos #####
    # Returns all todos or filtered list based on query
    # @params: query -> object {QUERY_KEY: QUERY_VAL}
    # @resolves: collection [{todo}]
    @get_todos = (query)=>
      # Setup the promise to be resolved when todos return
      dfd = $q.defer()
      # Check for and add query or use base url
      _url = if query then "#{@url}#{_format_query query}" else @url
      console.log '_URL', _url
      # Send the request to the API server
      $http.get _url
        .then (res)->
          # Strip the todos off the response and resolve the promise
          todos = res.data
          dfd.resolve todos
        .catch (err)->
          if err.status is 404
            dfd.resolve []
          else
            dfd.reject err
      # return the promise to the caller
      dfd.promise

    ##### add_todo #####
    # Posts a new todo to the API server
    # @params: new_todo -> object
    # @resolves: null
    @add_todo = (new_todo)=>
      dfd = $q.defer()
      # Post with the new_todo
      $http.post @url, new_todo
        # Don't much care about the 201 that comes back
        # Client will need to update with new todo collection
        .then dfd.resolve
        .catch dfd.reject
      dfd.promise

    ##### update_todo #####
    # Updates the specified todo with the given changes
    # @params: todo_id -> string
    # @params: updates -> object
    # @resolves: null
    @update_todo = (todo_id, updates)=>
      dfd = $q.defer()
      # Append the id
      _url = "#{@url}/#{todo_id}"
      # Send PATCH request to API server
      $http.patch _url, updates
        .then dfd.resolve
        .catch dfd.reject
      dfd.promise

    ##### delete_todo #####
    # Deletes the specified todo
    # @params: todo_id -> string
    # @resolves: null
    @delete_todo = (todo_id)=>
      dfd = $q.defer()
      # Append the id
      _url = "#{@url}/#{todo_id}"
      # Send DELETE request to API server
      $http.delete _url
        .then dfd.resolve
        .catch dfd.reject
      dfd.promise

module.exports = TodoService
