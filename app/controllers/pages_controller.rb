class PagesController < ApplicationController

    def home
        if user_signed_in?
            puts user_session
            @user = current_user
            friend_ids = @user.friends.pluck(:id)
            friend_ids << current_user.id
            @posts = Post.where(user_id: friend_ids)
        end

    end

    def about

    end

    def contact

    end

end
