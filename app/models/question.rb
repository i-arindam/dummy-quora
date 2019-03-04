class Question < ApplicationRecord
  belongs_to :user

  has_many :answers

  has_many :topic_mappings
  has_many :topics, through: :topic_mappings

  include HasVotesBehavior
  include HasCommentsBehavior

  def upvotes_count
    votes.upvotes.count
  end

  def downvotes_count
    votes.downvotes.count
  end
end
