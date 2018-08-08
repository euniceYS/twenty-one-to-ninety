import React, { Component } from 'react';
import HabitListTile from '../components/HabitListTile';

class HabitsIndexContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habitsArray: [],
      currentUser: ""
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
        currentUser: body.habits[0].user_fullname
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

    return(
      <div className="grid-container auto">
        <h1 className="page-title">{`${this.state.currentUser}'s Habits`}</h1>
        {habits}
      </div>
    );
  }
}

export default HabitsIndexContainer;
