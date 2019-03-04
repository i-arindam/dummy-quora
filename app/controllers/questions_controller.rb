class QuestionsController < ApplicationController

  before_action :find_question, only: [:upvote, :comment, :destroy]

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

  def upvote
    @question.question_votes.create!(user: current_user, vote_type: 'up')
  end

  def comment
    @comment = @question.comments.create!(:comment_params)
  end

  def downvote
    @question.question_votes.create!(user: current_user, vote_type: 'down')
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
