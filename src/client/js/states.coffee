base = "./js/views/"
module.exports = ($stateProvider)->
  $stateProvider
    .state 'home',
      url:'/'
      controller: 'home_ctrl'
      templateUrl: "#{base}home/home.html"
      resolve:
        todos: (todo_service)->
          todo_service.get_todos()
