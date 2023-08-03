# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    redirect_to @commentable, notice: 'Comment was successfully created.' if @comment.save
  end

  private

  def conment_params
    params.require(:comment).permit(:content)
  end
end
