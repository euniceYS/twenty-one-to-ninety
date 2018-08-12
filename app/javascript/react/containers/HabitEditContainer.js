import React, { Component } from 'react';
import { browserHistory } from 'react-router'
import InputTile from '../components/InputTile';

class HabitEditContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: "",
      start_date: "",
      error: []
    };
    this.handleChange = this.handleChange.bind(this);
    this.passPayload = this.passPayload.bind(this);
    this.onEdit = this.onEdit.bind(this);
  }

  handleChange(event) {
    this.setState({
     [event.target.name]: event.target.value
    });
  }

  passPayload(event) {
    event.preventDefault();
    let payload = {
        title: this.state.title,
        body: this.state.body,
        start_date: this.state.start_date
    };
    this.onEdit(payload);
    this.setState({
      title: "",
      body: "",
      start_date: ""
    });
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
        title: body.habit.title,
        body: body.habit.description,
        start_date: body.habit.start_date
      });
    })
    .catch(error => console.error(`Error in Habit Edit mount fetch: ${error.message}`));
  }

  onEdit(payload) {
    fetch(`/api/v1/habits/${this.props.params.id}.json`, {
      credentials: 'same-origin',
      method: 'PATCH',
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

          errors: body.errors
        });
      }
      else {
        browserHistory.push(`/habits/${this.props.params.id}`)
      }
    })
    .catch(error => {
      console.error(`Error in fetch: ${error.message}`);
    });
  }

  render(){
    return(
      <div className="grid-container auto">
        <h2 className="page-title">Edit the Habit</h2>
          <form onSubmit={this.passPayload} >
           <div className="x-grid">
             <InputTile
               name="title"
               label="What is your next habit?"
               type="text"
               value={this.state.title}
               handleChange={this.handleChange}
               />
             <InputTile
               name="body"
               label="Description"
               type="text"
               value={this.state.body}
               handleChange={this.handleChange}
               />
             <InputTile
               name="start_date"
               label="Start Date"
               type="date"
               value={this.state.start_date}
               handleChange={this.handleChange}
               />
             </div>
             <div>
               <input type="submit" value="Edit Habit" className="edit button"/>
             </div>
         </form>
      </div>
    );
  }
}

export default HabitEditContainer;
