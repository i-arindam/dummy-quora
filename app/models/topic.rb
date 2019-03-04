class Topic < ApplicationRecord
  has_many :topic_mappings
  has_many :questions, through: :topic_mappings
end
