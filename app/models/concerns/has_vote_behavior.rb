module HasVoteBehavior
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable

    module InstanceMethods
      def upvotes_count
        votes.upvote.count
      end

      def downvotes_count
        votes.downvote.count
      end

      def upvoters
        votes.upvote.map(&:user)
      end

      def downvoters
        votes.downvote.map(&:user)
      end
    end
  end
end
