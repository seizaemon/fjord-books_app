# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1
  def show
    if current_user.id != params[:id].to_i
      flash[:alert] = '閲覧権限がありません'
      redirect_to users_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end