class QuestionsController < ApplicationController

  def create
    @question = current_user.questions.create!(question_params)

    render 'questions/home_listing', question: @question, layout: false
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :description)
  end
end
