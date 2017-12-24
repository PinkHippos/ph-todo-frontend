import { combineReducers } from 'redux';
import TodoReducer from './task_reducer';
import ApplicationReducer from './application_reducer';

const rootReducer = combineReducers({
  tasks: TodoReducer,
  applications: ApplicationReducer,
});

export default rootReducer;
