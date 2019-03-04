class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true

  VOTE_UP = 1
  VOTE_DOWN = 2

  scope :upvote, -> { where(vote_type: VOTE_UP) }
  scope :downvote, -> { where(vote_type: VOTE_DOWN) }
end
