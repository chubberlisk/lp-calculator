class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    redirect_to root_path if @user != current_user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
