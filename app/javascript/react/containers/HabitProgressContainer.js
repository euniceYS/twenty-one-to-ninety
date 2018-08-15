import React, { Component } from 'react';
import CheckInDataTile from '../components/CheckInDataTile';

class HabitProgressContainer extends Component{
  constructor(props) {
    super(props);
    this.state = {
      checkIns: [],
      habitId: this.props.id
    }

  }

  componentDidMount(){
    console.log(`id is not passing down: ${this.state.habitId}`)
    fetch(`/api/v1/habits/${this.state.habitId}/check_ins.json`)
    .then(response => {
      if (response.ok) {
        return response;
        console.log(response)
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
        checkIns: body.check_ins
      })
    })
    .catch(error => console.error(`Error in habit show mount fetch: ${error.message}`));
  }

  render() {
    let checkInData = this.state.checkIns.map( checkIn => {

      return(
        <CheckInDataTile
          key={checkIn.id}
          id={checkIn.id}
          complete={checkIn.complete}
          />
      )
    })
    return (
      <div className="grid-container auto">
        {checkInData}
      </div>
    );
  }
}

export default HabitProgressContainer;
