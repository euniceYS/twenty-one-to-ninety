import React from 'react'

const HabitDetailTile = (props) => {
  let descriptionList;

    if (props.description != null) {
      descriptionList = <div>
                          <h3>description:</h3>
                          {props.description}
                        </div>;
    }

  return(
    <div className="grid-container auto">
      <h1 className="page-title">{props.title}</h1>
      <div className="">
        <ul>
          {descriptionList}
          <hr />
          <li className="">start date: {props.startDate}</li>
        </ul>
      </div>
    </div>
  );
};

export default HabitDetailTile;
