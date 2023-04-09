# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @user = User.find(params[:id])
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
