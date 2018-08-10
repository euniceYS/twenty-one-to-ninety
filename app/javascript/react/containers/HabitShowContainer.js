import React, { Component } from 'react';
import HabitDetailTile from '../components/HabitDetailTile';

class HabitShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      habit: {}
    };
  }

  componentDidMount(){
    fetch(`/api/v1/habits/${this.props.params.id}`)
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
    .catch(error => console.error(`Error in venue show mount fetch: ${error.message}`));
  }


  render(){
    let { id, title, description, start_date } = this.state.habit;

    return (
      <HabitDetailTile
        id={id}
        title={title}
        description={description}
        startDate={start_date}
        />
    );
  }
}

export default HabitShowContainer;
