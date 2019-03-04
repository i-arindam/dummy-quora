class CommentsController < ApplicationController
  before_action :find_parent, only: :create
  before_action :find_comment, only: [:update]
  include HasVotesActions

  def create
    @parent.comments.create!(comment_params)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render json: { errors: 'cannot update comment' }
    end
  end

  private

  def find_parent
    @parent ||= Question.find(params[:question_id]) if params[:question_id]
    @parent ||= Answer.find(params[:answer_id]) if params[:answer_id]
  end

  def find_comment
    @comment = comment_finder
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def initialize_object_for_voting
    @object = comment_finder
  end

  def comment_finder
    Comment.find(params[:id])
  end
end
