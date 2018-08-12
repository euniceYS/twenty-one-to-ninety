import React, { Component } from 'react';

class CheckInShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      complete: ''
    }
  }

  componentDidMount(){
    fetch(`/api/v1/check_ins/${this.props.params.id}`)
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
        check_in: body.check_in.complete
      });
    })
    .catch(error => console.error(`Error in venue show mount fetch: ${error.message}`));
  }

  render(){

    return(
      <div>

      </div>
    );
  }
}

export default CheckInShowContainer;
