class Api::V1::HabitsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index

    if current_user
      habits = current_user.habits
      habits.order(:start_date)
      graph_data = prep_data
    else
      habits = []
    end

    render json: {
      habits: ActiveModel::Serializer::CollectionSerializer.new(habits, each_serializer: HabitSerializer),
      current_user: current_user,
      graph_data: graph_data
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
      graph_data = prep_data
      render json: {
        habit: HabitSerializer.new(habit),
        graph_data: graph_data
      }
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
  def prep_data
    if current_user
      graph_data = [['Habit', 'Completed', 'Total Days']]
      habits = current_user.habits
      habits.each do |habit|
        habit_count = 0
        total_days = 0

        if habit.check_ins.length == 21
          total_days = 21
        else
          total_days = 90
        end

        habit.check_ins.each do |check_in|
          if check_in.complete
            habit_count += 1
          end
        end
        graph_data << [habit.title, habit_count, total_days]
      end
    end
      graph_data
  end

  def habit_params
    params.require(:habit).permit(:title, :body, :start_date)
  end
end
