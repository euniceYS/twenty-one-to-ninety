class Api::V1::CheckInsController < ApplicationController
  before_action :authenticate_user!
  #
  # def index
  #   check_ins = CheckIn.where(habit_id: params[:habit_id])
  #   render json: check_ins
  # end

  def show
    render json: CheckIn.find(params[:id])
  end
end
