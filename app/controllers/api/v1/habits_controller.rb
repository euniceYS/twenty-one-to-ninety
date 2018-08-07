class Api::V1::HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_destruction, :only => [:destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    @habits = Habit.all
    @user = User.all
    @habits.order(:start_date)
    render json: @habits
  end

  def show
    render json: @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      redirect_to @habit, notice: 'Successfully added habit.'
    else
      flash[:error] = @restaurant.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def habit_params
    params.require(:habit).permit(:title, :body, :start_date)
  end

  def authorize_destruction
    if !current_user || !current_user.admin?
      flash[:notice] = "Please sign up or sign in first."
      redirect_to user_session_path
    end
  end
end
