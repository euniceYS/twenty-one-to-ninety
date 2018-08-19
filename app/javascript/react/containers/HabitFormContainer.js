import React, { Component } from 'react'
import InputTile from '../components/InputTile'

class HabitFormContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: "",
      start_date: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.passPayload = this.passPayload.bind(this);
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
    this.props.onSubmit(payload);
    this.setState({
      title: "",
      body: "",
      start_date: ""
    });
  }

  render(){
    return(
      <div className="grid-container auto clear">
        <h2>Add New Habit</h2>
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
             <input type="submit" value="Add Habit" className="add button"/>
           </div>
         </form>
      </div>
    )
  }
}

export default HabitFormContainer
