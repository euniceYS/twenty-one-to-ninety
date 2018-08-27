import React from 'react'

const HabitProgressTile = (props) => {

  let checkInIcon;
  if (props.complete === true) {
    checkInIcon =
      <li onClick={() => props.onClickCheckIn(props.id)}>
        <i className="far fa-check-square"></i>
      </li>
  } else if (props.inFuture === true)  {
      checkInIcon = <i className="far fa-square future-check-box"></i>
  } else {
    checkInIcon =
      <li onClick={() => props.onClickCheckIn(props.id)}>
        <i className="far fa-square"></i>
      </li>
  }

  return (
    <div className="check-in-progress">
      <li>Day {props.dayNumber}</li>
      {checkInIcon}
    </div>
  );
}

export default HabitProgressTile
