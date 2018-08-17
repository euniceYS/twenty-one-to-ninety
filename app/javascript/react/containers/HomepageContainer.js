import React from 'react';

const HomepageContainer = (props) => {
  return(
    <div className="homepage">
      <div className="container">
        <h1>Track Your New Habits</h1>
        <h3>You will never regret it.</h3>
      </div>
        <div className="cta-button">
        <a href='/users/sign_in'>
          <span>Add New Habit</span>
          <i className="far fa-calendar-check"></i>
        </a>
      </div>
    </div>
  );
}

export default HomepageContainer;
