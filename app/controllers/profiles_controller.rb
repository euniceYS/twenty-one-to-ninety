class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  end

end
