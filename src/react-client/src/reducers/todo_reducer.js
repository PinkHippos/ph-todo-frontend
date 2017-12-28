import _ from 'lodash'
import { SET_TODO_FILTER, FETCH_TODOS } from '../actions/todo_actions'
import { RECEIVE_TODOS_SUCCESS, RECEIVE_TODOS_ERROR } from '../actions/todo_actions'

const initial_todo_state = {
  ids: [ 'id1', 'id2', 'id3' ],
  entities: {
    'id1': {
      text: 'todo 1',
      id: 'id1',
      status: 'new',
      createdAt: 'some time ago'
    },
    'id2': {
      text: 'todo 2',
      id: 'id2',
      status: 'new',
      createdAt: 'today'
    },
    'id3': {
      text: 'todo 3',
      id: 'id3',
      status: 'in_progress',
      createdAt: 'yesterday'
    }
  },
  current_filter: 'all',
  fetching: false,
  error: null
}
export default function (state = initial_todo_state, action){
  let { type, payload } = action;
  switch(type){
    case FETCH_TODOS:
      return {
        ...state,
        fetching: true
      }
    case RECEIVE_TODOS_SUCCESS:
      return {
        ...state,
        fetching: false,
        all: _.uniq([payload, ...state.all])
      };
    case RECEIVE_TODOS_ERROR:
      return {
        ...state,
        fetching: false,
        error: payload
      }
    case SET_TODO_FILTER:
      return {
        ...state,
        current_filter: payload
      };
    default:
      return state;
  }
};
