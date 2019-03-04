class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic, optional: true

  has_many :comments, as: :commentable

  has_many :answers
end
