import React from 'react';

const HabitDetailTile = (props) => {
  let descriptionList;

    if (props.description != null) {
      descriptionList = <li className="">{props.description}</li>;
    }

  return(
    <div className="grid-container auto">
      <h1 className="page-title">{props.title}</h1>
      <div className="">
        <ul>
          {descriptionList}
          <li className="">{props.startDate}</li>
        </ul>
      </div>
    </div>
  );
};

export default HabitDetailTile;
