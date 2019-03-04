class HomeController < ApplicationController

  def index
    @question = current_user.questions.new
  end
end
