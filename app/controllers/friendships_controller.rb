class FriendshipsController < ApplicationController

    def create  
        friendship = current_user.friendships.build(friend_id: params[:friend_id])
        if friendship.save
            flash.notice = "Friendship confirmation sent"
            redirect_to current_user
        else 
            puts friendship.errors.messages
            flash.now[:alert] = "Failed to add friend"
        end
    end

    def update
        puts params
        friendship = Friendship.find(params[:id])

        if friendship.update_attributes(status: "Approved")
            flash.notice = "Friend Approved"
            redirect_to current_user
        else
            puts friendship.errors.messages
            flash.now[:alert] = "Failed friendship confirm"
        end
    end
end
