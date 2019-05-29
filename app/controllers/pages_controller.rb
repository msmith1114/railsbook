class PagesController < ApplicationController

    def home
        if user_signed_in?
            @post = Post.new
            @comment = Comment.new
            @user = current_user
            friend_ids = @user.friends.ids
            friend_ids << current_user.id
            @posts = Post.where(user_id: friend_ids)
        else
            redirect_to sign_up_path
        end

    end

    def about

    end

    def contact

    end

end
