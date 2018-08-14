import React, { Component } from 'react';

class CheckInTile extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
  }

  render(){
    let checkIn = this.props.dailyCheckIn;
    let checkInIcon;
    if (checkIn) {
      checkInIcon = <button onClick={this.props.onClickCheckIn}><i className="far fa-check-square"></i></button>
    } else {
      checkInIcon = <button onClick={this.props.onClickCheckIn}><i className="far fa-square"></i></button>
    }

    return (
      <div className="check-in">
        {checkInIcon}
      </div>
    );
  }
};

export default CheckInTile;
