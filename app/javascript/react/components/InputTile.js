import React from 'react';

const InputTile = (props) => {

  return(
    <div>
      <label>{props.label}
        <input
          name={props.name}
          type={props.type}
          value={props.value}
          onChange={props.handleChange}
        />
      </label>
    </div>
  );
};

export default InputTile;
