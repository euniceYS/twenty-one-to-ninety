class Api::V1::HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_destruction, :only => [:destroy]
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  def index
    @habits = current_user.habits
    @habits.order(:start_date)
    render json: @habits
  end

  def show
    render json: @habit = Habit.find(params[:id])
  end

  protected

  def authorize_destruction
    if !current_user || !current_user.admin?
      flash[:notice] = "Please sign up or sign in first."
      redirect_to user_session_path
    end
  end
end
