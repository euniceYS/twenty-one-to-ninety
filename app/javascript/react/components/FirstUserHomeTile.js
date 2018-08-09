import React, { Component } from 'react';

const FirstUserHomeTile = (props) => {

  return (
    <div className="grid-container auto">
      <h1 className="page-title">{`${props.firstName}'s Habits`}</h1>
      <div className="gird-x">
        <h4>Add your first habit! </h4>
      </div>
    </div>
  );
};

export default FirstUserHomeTile;
