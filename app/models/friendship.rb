class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => 'User'
    validates :user, presence: true
    validates :friend, presence: true, uniqueness: { scope: :user, message: "Cannot have duplicate of same friend" }

    # Build the inverse friendship if approved
    after_update do
        inverse_friend = Friendship.new(friend_id: self.user_id, user_id: self.friend_id, status: "Approved")
        inverse_friend.save
    end
end
