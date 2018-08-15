import React from 'react';

const HabitProgressTile = (props) => {

  let checkInIcon;
  if (props.complete === true) {
    checkInIcon = <i className="far fa-check-square"></i>
  } else {
    checkInIcon = <i className="far fa-square"></i>
  }
  return (
    <div className="check-in-progress">
      <li>{props.checkInDate}</li>
      <li>{checkInIcon}</li>
    </div>
  );
}

export default HabitProgressTile;
