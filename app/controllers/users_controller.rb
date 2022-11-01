# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
end
