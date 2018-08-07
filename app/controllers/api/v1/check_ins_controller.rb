class Api::V1::CheckInsController < ApplicationController
  def show
    render json: CheckIn.find(params[:id])
  end
end
