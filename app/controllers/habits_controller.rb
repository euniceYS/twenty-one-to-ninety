class HabitsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end
  def show; end
  def new; end
  def create; end
  def destroy; end
end
