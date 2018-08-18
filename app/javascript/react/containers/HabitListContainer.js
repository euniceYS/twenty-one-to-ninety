import React, { Component } from 'react'
import { Link } from 'react-router'
import CheckInTile from '../components/CheckInTile'

class HabitListContainer extends Component{
  constructor(props) {
    super(props);
    this.state = {
      habit: {},
      completedMessage: ""
    }
    this.onClickCheckIn = this.onClickCheckIn.bind(this)
    this.checkForPrompt = this.checkForPrompt.bind(this)
    this.createSixtyNineCheckIns = this.createSixtyNineCheckIns.bind(this)
  }

  componentDidMount(){
    fetch(`/api/v1/habits/${this.props.id}.json`)
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
        habit: body.habit,
        completedMessage: ""
      })
    })
    .catch(error => console.error(`Error in habit show mount fetch: ${error.message}`));
  }

  onClickCheckIn() {
    let checkInId = this.state.habit.daily_check_in.id
    fetch(`/api/v1/habits/${this.props.id}/check_ins/${checkInId}`, {
      credentials: 'same-origin',
      method: 'PATCH',
      headers: {'Content-Type': 'application/json'},
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
      if(body.habit.check_ins.length === 21) {
        this.checkForPrompt(body.habit.check_ins)
      }
      this.setState({
        habit: body.habit,
        completedMessage: ""
      })
    })
    .catch(error => {
      console.error(`Error in fetch: ${error.message}`)
    });
  }

  checkForPrompt(checkIns) {
    let message, correctValues;
    correctValues = checkIns.map( checkIn => checkIn.complete )
    if(!correctValues.includes(false)){
      if(confirm("CONGRATULATIONS! You completed this habit for 21 days. :) Would you like to extend your tracking period of this habit to 90 days?") == true) {
        this.createSixtyNineCheckIns()
      } else {
        message = "Pick a New Habit! You can do it!"
        this.setState({
          completedMessage: message
        })
      }
    }
  }

  createSixtyNineCheckIns() {
    fetch(`/api/v1/habits/${this.props.id}/additional_check_ins`, {
      credentials: 'same-origin',
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
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
      debugger
      this.setState({
        habit: body.habit,
        completedMessage: "You can do this!"
      })
    })
    .catch(error => {
      console.error(`Error in fetch: ${error.message}`)
    });
  }

  render() {
    let checkStatus;
    if (
      this.state.habit !== undefined &&
      this.state.habit.daily_check_in !== undefined
    ){
      checkStatus = this.state.habit.daily_check_in.complete
    }

    return (
      <div>
        {this.state.completedMessage}
        <div className="habit-tiles">
          <div className="habit-info">
            <h4>{this.props.title}</h4>
            start date: {this.props.startDate}
            <Link to= {`/habits/${this.props.id}`}>
              <i className="fas fa-info-circle"></i>
            </Link>
          </div>
          <CheckInTile
            dailyCheckIn = {checkStatus}
            onClickCheckIn = {this.onClickCheckIn}
            />
        </div>
      </div>
    );
  }
}

export default HabitListContainer;
