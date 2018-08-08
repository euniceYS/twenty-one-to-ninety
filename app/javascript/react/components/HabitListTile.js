import React, { Component } from 'react';
import { Link } from 'react-router';

class HabitListTile extends Component{
  constructor(props) {
    super(props);
  }

  render() {

    return (
        <div className="grid-container habit-tile auto">
          <div className="grid-x">

            <Link to= {`/habits/${this.props.id}`}>
              <div className="cell small-9">
                <h4>{this.props.title}</h4>
                <strong>start date:</strong> {this.props.startDate}
                <i className="fas fa-info-circle"></i>
              </div>
            </Link>

            <div className="cell small-3">
              <i className="far fa-check-square"></i>
            </div>

          </div>
        </div>

    );
  }
}

export default HabitListTile;
