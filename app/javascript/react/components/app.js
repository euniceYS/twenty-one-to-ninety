import React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLifeRing } from '@fortawesome/free-solid-svg-icons';

library.add(faLifeRing);

export const App = (props) => {
  return (
    <div className="grid-container auto">
    <h1>Track Your New Habit
      <FontAwesomeIcon
        icon={'life-ring'}
        color="#6DB65B"
        size="sm"
        pulse
        style={{ textShadow: '0 1px 0 rgba(0, 0, 0, 0.1)' }}
        />
      </h1>
  </div>
  );
};

export default App;
