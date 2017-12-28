import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { set_todo_filter } from '../../actions/todo_actions'
import FilterButton from '../../components/FilterButton'

class TodoList extends Component {

  constructor(props){
    super(props);
    this.render_list = this.render_list.bind(this);
  };
  render_list(){
    let elements = [];
    this.props.ids.forEach((id) => {
      const todo = this.props.todos[id];
      console.log('TODO', todo, this.props.current_filter);
      if (todo.status === this.props.current_filter || this.props.current_filter === 'all'){
        elements.push(
          <li key={todo.id}>
            <p>Text: {todo.text}</p>
            <p>Status: {todo.status}</p>
            <p>Created At: {todo.createdAt}</p>
          </li>
        )
      }
    });
    return elements
  }
  render(){
    return (
      <div>
        <FilterButton
          set_filter={this.props.set_todo_filter}
          filter_value='new'
          filter_name='New' />
        <FilterButton
          set_filter={this.props.set_todo_filter}
          filter_value='in_progress'
          filter_name='In Progress' />
        <FilterButton
          set_filter={this.props.set_todo_filter}
          filter_value='complete'
          filter_name='Complete' />
        <ul>
          {this.render_list()}
        </ul>
      </div>
    );
  };

};

const mapStateToProps = ({todos}) => {
  return {
    todos: todos.entities,
    ids: todos.ids,
    current_filter: todos.current_filter
  }
};

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators({
    set_todo_filter
  }, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
