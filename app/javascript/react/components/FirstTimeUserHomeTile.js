import React from 'react'

const FirstTimeUserHomeTile = (props) => {
  return (
    <div className="grid-container auto">
      <h1 className="page-title">{`${props.firstName}'s Habits`}</h1>
      <div className="gird-x placeholder">
        <h4 className="headline-placeholder">What habits should you track?</h4>
        <p>People say, from their own experiences and a lot of research, they have learned some of the pitfalls of building new habits. They have also learned what sets them up for success when choosing a new habit to track.</p>
        <strong>When you choose a new habit to track, look for these three aspects:</strong>
        <ul className="text-placeholder">
          <li>Motivation</li>
          <li>Regularity</li>
          <li>Achievability</li>
        </ul>
      </div>
    </div>
  )
}

export default FirstTimeUserHomeTile
