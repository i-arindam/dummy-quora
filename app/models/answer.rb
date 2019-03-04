class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :follows, as: :followable

  include HasVotesBehavior
  include HasCommentsBehavior
end
