import axios from 'axios'

export const SET_VISIBLE_TODOS = 'SET_VISIBLE_TODOS'
export function set_visible_todos(filter){
  return {
    type: SET_VISIBLE_TODOS,
    payload: filter
  };
};

export const RECEIEVE_TODOS_SUCCESS = 'RECEIEVE_TODOS_SUCCESS'
export function recieve_todos(todos){
  return {
    type: RECEIEVE_TODOS_SUCCESS,
    payload: todos
  }
}

export const RECEIVE_TODOS_ERROR = 'FETCH_TODO_ERROR';
export function fetch_todo_error(error){
  return {
    type: RECEIVE_TODOS_ERROR,
    payload: err
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
