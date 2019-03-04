class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  has_many :replies, as: :repliable

  include HasVotesBehavior
end
