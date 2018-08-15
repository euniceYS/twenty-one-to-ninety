import React, { Component } from 'react'
import HabitDetailTile from '../components/HabitDetailTile'
import HabitProgressTile from '../components/HabitProgressTile'
import { browserHistory } from 'react-router'
import { Link } from 'react-router'

class HabitShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habit: {}
    }
    this.handleDelete = this.handleDelete.bind(this);
    this.confirm = this.confirm.bind(this);
  }

  componentDidMount(){
    fetch(`/api/v1/habits/${this.props.params.id}.json`)
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
        habit: body.habit
      });
    })
    .catch(error => console.error(`Error in habit show mount fetch: ${error.message}`));
  }

  confirm(event) {
    if(confirm('Are you sure you want to delete this habit?')) {
      this.handleDelete();
    } else {
      event.preventDefault();
    }
  }

  handleDelete() {
    fetch(`/api/v1/habits/${this.props.params.id}.json`, {
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json', 'X-Requested-With': 'XHMLttpRequest' },
      method: 'DELETE'
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
    .then(body => browserHistory.push('/habits'))
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let { id, title, description, start_date} = this.state.habit;

    let checkIns;
    if (this.state.habit.check_ins !== undefined) {
      checkIns = this.state.habit.check_ins.map( checkIn => {
        return(
          <div key = {checkIn.id} className="check-in-data">
            <HabitProgressTile
              id = {checkIn.id}
              complete = {checkIn.complete}
              checkInDate = {checkIn.check_in_date}
              />
          </div>
        )
      })
    }
    return (
      <div className="grid-container auto text-center">
        <HabitDetailTile
          id={id}
          title={title}
          description={description}
          startDate={start_date}
          />
        <div className="edit-delete">
          <Link to={`/habits/${this.props.params.id}/edit`} className="edit button">Edit</Link>
          <button onClick={this.confirm} className="delete button">Delete</button>
        </div>
        <div className="wrapper">
          <h4>21 day progress</h4>
          {checkIns}
        </div>
      </div>
    );
  }
}

export default HabitShowContainer;
