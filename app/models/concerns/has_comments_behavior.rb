module HasCommentsBehavior
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable

    include HasVotesBehavior

    module InstanceMethods
      def comments_count
        comments.count
      end
    end
  end
end
