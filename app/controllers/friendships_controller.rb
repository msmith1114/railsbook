class FriendshipsController < ApplicationController

    def create  
        pending_friend = User.find(params[:friend_id])
        friendship = pending_friend.friendships.build(friend_id: current_user.id)
        if friendship.save
            flash.notice = "Friendship confirmation sent"
            redirect_to root_path
        else 
            puts friendship.errors.messages
            flash.now[:alert] = "Failed to add friend"
        end
    end

    def update
        friendship = Friendship.find(params[:id])

        if friendship.update_attributes(status: "Approved")
            flash.notice = "Friend Approved"
            redirect_to root_path
        else
            puts friendship.errors.messages
            flash.now[:alert] = "Failed friendship confirm"
        end
    end
end
