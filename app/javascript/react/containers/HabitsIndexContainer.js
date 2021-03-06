import React, { Component } from 'react'
import { render } from 'react-dom'
import { Chart } from 'react-google-charts'
import HabitListContainer from '../containers/HabitListContainer'
import FirstTimeUserHomeTile from '../components/FirstTimeUserHomeTile'
import VisitorHomepage from '../components/VisitorHomepage'
import HabitFormContainer from '../containers/HabitFormContainer'
import BarChart from '../components/BarChart'

class HabitsIndexContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habitsArray: [],
      currentUser: null,
      checkInsArray: [],
      notice: "",
      errors: [],
      graphData: []
    };
    this.onSubmit = this.onSubmit.bind(this);
  }

  componentDidMount() {
    fetch(`/api/v1/habits.json`, {
      credentials: 'same-origin'
    }).then(response => {
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
        currentUser: body.current_user,
        graphData: body.graph_data
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
    }).then(response => {
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
          graphData: body.graph_data,
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
        <div key={habit.id}>
          <HabitListContainer
            id={habit.id}
            title={habit.title}
            startDate={habit.start_date}
            />
        </div>
      );
    });

    let errorDiv, errorItems, notice, homepage;

    if (this.state.errors.length != 0) {
      errorItems = this.state.errors.map( error => {
        return (<li key={error}>{error}</li>)
      })
      errorDiv = <div className="errors">{errorItems}</div>
    }

    if (this.state.notice){
      notice = <li className="notice" key={notice}>{this.state.notice}</li>
    }

    if (this.state.currentUser === null) {
      homepage = <VisitorHomepage />
    } else if (this.state.currentUser !== null && !this.state.habitsArray.length){
      homepage =  <div className="grid-container auto">
                    <FirstTimeUserHomeTile
                      key={this.state.currentUser.id}
                      id={this.state.currentUser.id}
                      firstName={this.state.currentUser.first_name}
                      />
                    {notice}
                    {errorDiv}
                    <HabitFormContainer
                      onSubmit = {this.onSubmit}
                      currentUser = {this.state.currentUser}
                      />
                  </div>

    } else {
      homepage =  <div className="grid-container auto">
                    <h1 className="page-title">{`${this.state.currentUser.first_name}'s Habits`}</h1>
                    <div>
                      {habits}
                    </div>
                    <BarChart
                      data = {this.state.graphData}
                      />
                    {notice}
                    {errorDiv}
                    <HabitFormContainer
                      onSubmit = {this.onSubmit}
                      currentUser = {this.state.currentUser}
                      />
                  </div>
    }
    return(
      <div>
        {homepage}
      </div>
    );
  }
}

export default HabitsIndexContainer
