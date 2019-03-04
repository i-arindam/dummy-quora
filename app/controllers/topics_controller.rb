class TopicsController < ApplicationController

  include HasFollowActions

  def show
    topic_finder
  end

  private

  def initialize_object_for_following
    @object = topic_finder
  end

  def topic_finder
    @topic = Topic.find(params[:id])
  end
end
