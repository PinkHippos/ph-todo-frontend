import _ from 'lodash'
import { SET_VISIBLE_TODOS, FETCH_TODOS } from '../actions/todo_actions'
import { RECEIEVE_TODOS_SUCCESS, RECEIEVE_TODOS_ERROR } from '../actions/todo_actions'

const initial_todo_state = {
  all: [],
  visible: [],
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
    case RECEIEVE_TODOS_SUCCESS:
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
    case SET_VISIBLE_TODOS:
      return {
        ...state,
        current_filter: payload
      };
    default:
      return state;
  };
};
