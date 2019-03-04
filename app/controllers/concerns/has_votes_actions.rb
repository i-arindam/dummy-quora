module HasVotesActions
  extend ActiveSupport::Concern

  included do
    before_action :initialize_object_for_voting, only: [:upvote, :downvote, :upvoters, :downvoters]

    module ClassMethods
      def upvote
        @object.votes.create!(vote_type: Vote::VOTE_UP, user: current_user)
      end

      def downvote
        @object.votes.create!(vote_type: Vote::VOTE_DOWN, user: current_user)
      end

      def upvoters
        @object.upvoters
      end

      def downvoters
        @object.downvoters
      end
    end
  end
end
