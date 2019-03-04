class Question < ApplicationRecord
  belongs_to :user
  # belongs_to :topic, optional: true

  has_many :comments, as: :commentable

  has_many :answers

  has_many :topic_mappings
  has_many :topics, through: :topic_mappings

  has_many :question_upvotes

  def upvotes_count
    question_upvotes.count
  end
end
