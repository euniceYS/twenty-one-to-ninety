import React from 'react'
import { render } from 'react-dom'
import { Chart } from 'react-google-charts'

const BarChart = (props) => {
  return (
    <div className="grid-container auto graph-bar">
      <Chart
        width={"92%"}
        height={"200px"}
        chartType="Bar"
        loader={<div>Loading Chart</div>}
        data={props.data}
        options={{
          chart: {
            title: 'My habit collection'
          },
          hAxis: {
            title: 'Total Days',
            minValue: 0,
            maxValue: 21,
            backgroundColor: {
            fill: '#E8E4D8'
          },
        },
        vAxis: {
          title: 'Habit'
        },
        bars: 'horizontal',
        axes:{
          y:{
            0: { side: 'left' }
          },
        },
          colors: ['#6a3c72', '#c9d2cc']
        }}
        graph_id="BarChart"
        legend_toggle
      />
    </div>
  );
}

export default BarChart
