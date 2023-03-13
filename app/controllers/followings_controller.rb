class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = user.followings.create(following_params)
    redirect_to user_path(User.find(following_params[:current_user]))
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy
    redirect_to user_path(User.find(following_params[:current_user]))
  end

  private

  def user
    # @user ||= User.find(user_params[:user_id])
    User.find(params[:user_id])
  end

  def following_params
    params.permit(:following_user_id)
  end

  # def user_params
  #   params.permit(:id)
  # end
end