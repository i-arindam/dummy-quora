class RepliesController < ApplicationController
  include HasVoteActions
  before_action :reply_finder, only: [:update]

  def create
    @reply = Comment.find(params[:comment_id]).replies.create!(reply_params)
  end

  def update
    if @reply.update(reply_params)
      redirect_to @reply
    else
      render json: { errors: 'cannot update reply' }
    end
  end

  private

  def parent

  end

  def initialize_object_for_voting
    @object = reply_finder
  end

  def reply_finder
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end
