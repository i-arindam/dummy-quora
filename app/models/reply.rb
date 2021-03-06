class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  include HasVotesBehavior
  include HasCommentsBehavior
end
