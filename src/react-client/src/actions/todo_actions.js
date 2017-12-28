import axios from 'axios'

export const SET_TODO_FILTER = 'SET_TODO_FILTER'
export function set_todo_filter(filter){
  console.log('setting visible todos', filter);
  return {
    type: SET_TODO_FILTER,
    payload: filter
  };
};

export const RECEIVE_TODOS_SUCCESS = 'RECEIVE_TODOS_SUCCESS'
export function recieve_todos(todos){
  return {
    type: RECEIVE_TODOS_SUCCESS,
    payload: todos
  }
}

export const RECEIVE_TODOS_ERROR = 'FETCH_TODO_ERROR';
export function fetch_todo_error(error){
  return {
    type: RECEIVE_TODOS_ERROR,
    payload: error
  };
}

export const FETCH_TODOS = 'FETCH_TODOS';
export function fetch_todos(){
  return {
    type: FETCH_TODOS,
    payload: dispatch => {
      axios.get('/api/todos')
      .then( response => {
        dispatch(recieve_todos(response.data));
      })
      .catch( err => {
        dispatch(fetch_todo_error(err));
      })
    }
  };
}
