class QuestionsController < ApplicationController
  before_action :find_question, only: [:update]
  include HasVotesActions
  include HasFollowActions

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render json: { errors: 'cannot update question' }
    end
  end

  def create
    @question = current_user.questions.create!(question_params)

    assign_topics

    render 'questions/home_listing', question: @question, layout: false
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question.destroy!
  end

  private

  def question_params
    params.require(:question).permit(:body, :description)
  end

  def initialize_object_for_voting
    @object = question_finder
  end

  def initialize_object_for_following
    @object = question_finder
  end

  def find_question
    @question = question_finder
  end

  def question_finder
    Question.find(params[:id])
  end

  def assign_topics
    topics = params[:topics].split(',')
    found_topics = Topic.where(name: topics)

    found_topics.each do |topic|
      TopicMapping.create!(topic: topic, question: @question)
    end

    (topics - found_topics).each do |topic|
      new_topic = Topic.create!(name: topic)
      TopicMapping.create!(topic: new_topic, question: @question)
    end
  end
end
