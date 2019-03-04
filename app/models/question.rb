class Question < ApplicationRecord
  belongs_to :user
  # belongs_to :topic, optional: true

  has_many :comments, as: :commentable

  has_many :answers

  has_many :topic_mappings
  has_many :topics, through: :topic_mappings

  include HasVoteBehavior

  def upvotes_count
    votes.upvotes.count
  end

  def downvotes_count
    votes.downvotes.count
  end
end
