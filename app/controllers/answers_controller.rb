class AnswersController < ApplicationController
  before_action :find_answer, only: [:update]
  include HasVotesActions
  include HasFollowActions

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render json: { errors: 'cannot update answer' }
    end
  end

  private

  def find_answer
    @answer = answer_finder
  end

  def initialize_object_for_voting
    @object = answer_finder
  end

  def initialize_object_for_following
    @object = answer_finder
  end

  def answer_finder
    Answer.find(params[:id])
  end
end
