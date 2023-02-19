# frozen_string_literal: true

class FollowRelationsController < ApplicationController
  def create
    user = User.find(params[:follower_id])
    current_user.follow user
    redirect_to followings_user_path(current_user)
  end

  def destroy
    FollowRelation.find(params[:id]).destroy
    redirect_to followings_user_path(current_user)
  end
end
