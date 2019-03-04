class TopicMapping < ApplicationRecord
  belongs_to :topic
  belongs_to :question
end
