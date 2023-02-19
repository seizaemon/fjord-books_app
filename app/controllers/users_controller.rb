# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.follow(params[:id])
    @users = current_user.followings.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end

  def unfollow
    current_user.unfollow(params[:id])
    @users = current_user.followings.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end

  def followings
    @user = User.find(params[:id])
    # @title = t("#{@user.name}'s following Users"
    @title = t('views.followings_title', email: @user.email)
    @users = @user.followings.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @title = t('views.followers_title', email: @user.email)
    @users = @user.followers.with_attached_avatar.page(params[:page])
    render 'show_follow'
  end
end
