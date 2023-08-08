# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) if @comment.save
  end

  def index
    @comments = @commentable.comments
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def update
    redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human) if @comment.update(comment_params)
  end

  def edit; end

  private

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
