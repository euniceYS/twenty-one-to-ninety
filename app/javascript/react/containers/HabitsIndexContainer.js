import React, { Component } from 'react';
import HabitListTile from '../components/HabitListTile';
import FirstUserHomeTile from '../components/FirstUserHomeTile';
import HomepageContainer from '../containers/HomepageContainer';
import HabitFormContainer from '../containers/HabitFormContainer';

class HabitsIndexContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habitsArray: [],
      currentUser: null,
      notice: "",
      errors: []
    };
    this.onSubmit = this.onSubmit.bind(this);
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

  onSubmit(payload) {
    fetch(`/api/v1/habits`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(payload),
      headers: {'Content-Type': 'application/json'}
    })
    .then(response => {
      if (response.ok) {
        return response;
      }
      else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      if (body.errors) {
        this.setState({
          notice: "",
          errors: body.errors
        });
      }
      else {
        this.setState({
          habitsArray: this.state.habitsArray.concat(body.habit),
          notice: "Habit successfully added",
          errors: []
        });
      }
    })
    .catch(error => {
      console.error(`Error in fetch: ${error.message}`);
    });
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
      homepage =  <div className="grid-container auto">
                    <FirstUserHomeTile
                      key={this.state.currentUser.id}
                      id={this.state.currentUser.id}
                      firstName={this.state.currentUser.first_name}
                      />
                      <HabitFormContainer
                        onSubmit = {this.onSubmit}
                        currentUser = {this.state.currentUser}
                        />
                  </div>
    } else {
      homepage =  <div className="grid-container auto">
                    <h1 className="page-title">{`${this.state.currentUser.first_name}'s Habits`}</h1>
                    {habits}
                    <HabitFormContainer
                      onSubmit = {this.onSubmit}
                      currentUser = {this.state.currentUser}
                      />
                  </div>
    }
    return(
      <div>
        <div>
          {homepage}
        </div>
      </div>
    );
  }
}

export default HabitsIndexContainer;
