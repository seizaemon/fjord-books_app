# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  def create
    user = User.find(params[:follower_id])
    current_user.follow user unless current_user.following?(user)
    redirect_to followings_user_path(current_user)
  end

  def destroy
    user = User.find(params[:follower_id])
    current_user.unfollow user if current_user.following?(user)
    redirect_to followings_user_path(current_user)
  end
end
