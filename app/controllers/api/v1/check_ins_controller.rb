class Api::V1::CheckInsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    check_ins = CheckIn.where(habit_id: params[:habit_id]).order(:id)

    render json: check_ins
  end

  def update
    check_in = CheckIn.find(params[:id])
    if check_in["complete"] == false
      check_in.update({ complete: true })
    else
      check_in.update({ complete: false })
    end

    habit = Habit.find(params[:habit_id])

    render json: habit
  end
end
