class Api::V1::HabitsController < ApplicationController
  before_action :authorize_destruction, :only => [:destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    if current_user
      @habits = current_user.habits
      @habits.order(:start_date)
    else
      @habits = []
    end
    render json: {habits: @habits, current_user: current_user}
  end

  def show
    @habit = Habit.find(params[:id])
      if current_user = @habit.user
        @habit
      else
        @habit = {}
      end
    render json: @habit
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
    habit = Habit.find(params[:id])
  end

  protected

  def authorize_destruction
    if !current_user || !current_user.admin?
      flash[:notice] = "Please sign up or sign in first."
      redirect_to user_session_path
    end
  end

  def habit_params
    params.require(:habit).permit(:title, :body, :start_date)
  end
end
