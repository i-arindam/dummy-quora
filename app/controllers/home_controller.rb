class HomeController < ApplicationController

  def index
    @question = current_user.questions.new

    @questions = current_user.questions
  end
end
