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

    render json: habit
  end

  def create
    habit = Habit.new(habit_params)
    habit.user = current_user
    if habit.save
      render json: habit
    else
      render json: { errors: review.errors.full_messages }
    end
  end

  def update
    edited_habit = Habit.find(params[:id])
    if edited_habit.update(habit_params)
      render json: edited_habit
    else
      render json: { errors: review.errors.full_messages }
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
