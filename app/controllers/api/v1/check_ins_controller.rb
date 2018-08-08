class Api::V1::CheckInsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    render json: CheckIn.find(params[:id])
  end
end
