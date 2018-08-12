import React, { Component } from 'react';
import { Link } from 'react-router';

class HabitListTile extends Component{
  constructor(props) {
    super(props);
  }

  render() {

    return (
      <div className="habit-tile">
        <Link to= {`/habits/${this.props.id}`}>
          <div className="habit-info">
            <h4>{this.props.title}</h4>
            start date: {this.props.startDate}
            <i className="fas fa-info-circle"></i>
          </div>
        </Link>

        <div className="check-in">
          <i className="far fa-check-square"></i>
        </div>
      </div>
    );
  }
}

export default HabitListTile;
