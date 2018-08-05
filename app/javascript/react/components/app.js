import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faStroopwafel } from '@fortawesome/free-solid-svg-icons'

library.add(faStroopwafel)

export const App = (props) => {
  return (
    <div>
    <h1>Make It So React</h1>
    Favorite Food: <FontAwesomeIcon icon="stroopwafel" />
  </div>
  )
}

export default App
