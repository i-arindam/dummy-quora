class QuestionsController < ApplicationController

  before_action :find_question, only: [:upvote, :follow, :comment, :destroy]

  def create
    @question = current_user.questions.create!(question_params)

    render 'questions/home_listing', question: @question, layout: false
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question.destroy!
  end

  def upvote
    @question.question_upvotes.create!(user: current_user)
  end

  def follow

  end

  def comment
    @comment = @question.comments.create!(:comment_params)
  end

  private

  def question_params
    params.require(:question).permit(:body, :description)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
