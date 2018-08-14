class Api::V1::CheckInsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    check_ins = CheckIn.where(habit_id: params[:habit_id])

    render json: check_ins
  end

  def update
    check_ins = CheckIn.where(habit_id: params[:habit_id])
    check_ins.each do |check_in|
      if check_in["check_in_date"] == Date.today
        if check_in["complete"] == false
          check_in.update({ complete: true })
        else
          check_in.update({ complete: false })
        end

        habit = Habit.find(params[:habit_id])
        check_in = habit.check_ins.select {
          |checkin| checkin['check_in_date'] == Date.today
        }
        check_in = check_in[0]
        response = {
          habit: {
            daily_check_in: check_in,
            description: habit.body,
            id: habit.id,
            start_date: habit.start_date,
            title: habit.title,
            user_id: habit.user_id
          }
        }

        render json: response
      end
    end
  end
end
