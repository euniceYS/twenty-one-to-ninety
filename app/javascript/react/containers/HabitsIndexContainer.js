import React, { Component } from 'react';
import HabitListTile from '../components/HabitListTile';
import FirstUserHomeTile from '../components/FirstUserHomeTile';
import HomepageContainer from '../containers/HomepageContainer';

class HabitsIndexContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habitsArray: [],
      currentUser: null
    };
  }

  componentDidMount() {
    fetch(`/api/v1/habits`, {
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        habitsArray: body.habits,
        currentUser: body.current_user
      });
    })
    .catch(error => console.error(`Error in fetch: ${error}`));
  }

  render(){
    let habits = this.state.habitsArray.map( habit => {
      return (
        <HabitListTile
          key={habit.id}
          id={habit.id}
          title={habit.title}
          startDate={habit.start_date}
          />
      );
    });

    let homepage;
    if (this.state.currentUser === null) {
      homepage = <HomepageContainer />;
    } else if (this.state.currentUser !== null && this.state.habitsArray.length == 0){
      homepage = <FirstUserHomeTile
                  key={this.state.currentUser.id}
                  id={this.state.currentUser.id}
                  firstName={this.state.currentUser.first_name}
                  />;
    } else {
      homepage = <div className="grid-container auto">
        <h1 className="page-title">{`${this.state.currentUser.first_name}'s Habits`}</h1>
        {habits}
      </div>;
    }
    return(
      <div>
        {homepage}
      </div>
    );
  }
}

export default HabitsIndexContainer;
