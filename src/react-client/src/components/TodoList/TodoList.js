import React, { Component } from 'react';

class TodoList extends Component {

  constructor(props){
    super(props);
    this.render_list = this.render_list.bind(this);
  };
  render_list(filter, todos){
    if (filter !== 'all'){
      todos = todos.filter((todo) => todo.status === filter);
    }
    let elements = todos.map((todo) => {
      return (
        <li>
          <p>Text: {todo.text}</p>
          <p>Status: {todo.status}</p>
          <p>Created At: {todo.createdAt}</p>
        </li>
      )
    });
    return elements
  }
  render(){
    return (
      <ul>
        {this.render_list(this.props.current_filter, this.props.todos)}
      </ul>
    );
  };

};

export default TodoList;
