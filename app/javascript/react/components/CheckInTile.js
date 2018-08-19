import React from 'react'

const CheckInTile = (props) => {
  let checkIn = props.dailyCheckIn;
  let checkInIcon;
  if (checkIn) {
    checkInIcon = <button onClick={props.onClickCheckIn}><i className="far fa-check-square"></i></button>
  } else {
    checkInIcon = <button onClick={props.onClickCheckIn}><i className="far fa-square"></i></button>
  }
  return (
    <div className="check-in">
      {checkInIcon}
    </div>
  );
}

export default CheckInTile
