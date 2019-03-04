module HasFollowActions
  extend ActiveSupport::Concern

  included do
    before_action :initialize_object_for_following, only: [:follow, :unfollow, :followers]

    module ClassMethods
      def follow
        @object.follows.create!(user: current_user)
      end

      def unfollow
        @object.follows.where(user: current_user).destroy!
      end

      def followers
        @object.follows.map(&:user)
      end
    end
  end
end
