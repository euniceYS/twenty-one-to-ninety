import React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import HabitsIndexContainer from '../containers/HabitsIndexContainer';
import HabitShowContainer from '../containers/HabitShowContainer';

export const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/' component={HabitsIndexContainer} />
      <Route path='/habits/:id' component={HabitShowContainer} />
    </Router>
  );
};

export default App;
