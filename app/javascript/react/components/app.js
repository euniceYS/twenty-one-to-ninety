import React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import HabitsIndexContainer from '../containers/HabitsIndexContainer';
import HabitShowContainer from '../containers/HabitShowContainer';
import HabitEditContainer from '../containers/HabitEditContainer';

export const App = (props) => {
  $(function(){
    var flashDurationInSeconds = 5;
    var flashContainerId = 'flash-messages';

    function removeFlashMessages() {
      $('#' + flashContainerId).remove();
    }
    setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
  })

  return (
    <Router history={browserHistory}>
      <Route path='/' >
        <IndexRoute component={HabitsIndexContainer} />
        <Route path="/habits" component={HabitsIndexContainer} />
        <Route path='/habits/:id' component={HabitShowContainer} />
        <Route path='/habits/:id/edit' component={HabitEditContainer} />
      </Route>
    </Router>
  );
};

export default App;
