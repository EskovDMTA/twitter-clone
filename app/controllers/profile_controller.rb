class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :email, :url, :bio, :location, :avatar)
  end
end