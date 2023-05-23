class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def show
    @user = User.first
    @owner = User.first
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:icon)
  end
  
  def is_matching_login_user
    user = User.first
    unless user.id == current_user.id
      redirect_to photos_path
    end
  end
end
