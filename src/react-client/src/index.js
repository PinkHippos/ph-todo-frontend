import registerServiceWorker from './registerServiceWorker';
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import { BrowserRouter, Route } from 'react-router-dom'
import reducers from './reducers';

import TodoList from './containers/TodoList/'

const createStoreWithMiddleware = applyMiddleware()(createStore);
class Hello extends React.Component {
  render(){ return <div>Hello!</div> };
};
class Goodbye extends React.Component {
  render(){ return <div>Goodbye!</div> };
};
ReactDOM.render(
  <Provider store={createStoreWithMiddleware(reducers)}>
    <BrowserRouter>
      <div>
        <Route path='/hello' component={Hello} />
        <Route path='/goodbye' component={Goodbye} />
        <Route path='/todos' component={TodoList} />
      </div>
    </BrowserRouter>
  </Provider>
  , document.querySelector('#root'));

registerServiceWorker();
