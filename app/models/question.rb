class Question < ApplicationRecord
  belongs_to :user

  has_many :answers

  has_many :topic_mappings
  has_many :topics, through: :topic_mappings

  has_many :follows, as: :followable

  include HasVotesBehavior
  include HasCommentsBehavior
end
