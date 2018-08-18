class Api::V1::HabitsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    if current_user
      habits = current_user.habits
      habits.order(:start_date)
    else
      habits = []
    end

    render json: {
      habits: ActiveModel::Serializer::CollectionSerializer.new(habits, each_serializer: HabitSerializer),
      current_user: current_user
    }
  end

  def show
    habit = Habit.find(params[:id])
      if current_user = habit.user
        habit
      else
        habit = {}
      end

    render json: habit, serializer: HabitShowSerializer
  end

  def create
    habit = Habit.new(habit_params)
    habit.user = current_user
    if habit.save
      render json: habit
    else
      render json: { errors: habit.errors.full_messages }
    end
  end

  def update
    edited_habit = Habit.find(params[:id])
    if edited_habit.update(habit_params)
      existing_check_ins = edited_habit.check_ins
      new_start_date = edited_habit.start_date

      existing_check_ins.each do |check_in|
        check_in_attributes = {
          complete: false,
          check_in_date: new_start_date
        }
        check_in.update_attributes(check_in_attributes)
        new_start_date += 1
      end

      render json: edited_habit
    else
      render json: { errors: edited_habit.errors.full_messages }
    end
  end

  def destroy
    destroy_habit = Habit.find(params[:id])
    if destroy_habit.destroy
      render json: {body: "Deleted Successfully."}
    else
      render json: {error: "Delete Failed."}
    end
  end

  protected

  def habit_params
    params.require(:habit).permit(:title, :body, :start_date)
  end
end
