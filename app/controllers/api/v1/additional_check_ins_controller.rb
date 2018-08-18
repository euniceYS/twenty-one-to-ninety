class Api::V1::AdditionalCheckInsController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    check_ins = habit.check_ins[0..20]
    more_check_ins = Habit.new.make_to_ninety_days(check_ins)
    Habit.new.build_additional_check_ins(more_check_ins, habit)

    render json: habit
  end
end
