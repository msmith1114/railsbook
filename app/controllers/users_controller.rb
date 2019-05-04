class UsersController < ApplicationController


    def show
        @user = User.find(params[:id])
        @post = Post.new
        @posts = @user.posts
    end

    def search
        @users = User.where('first_name LIKE ?', "%#{params[:q]}%")
    end 

end
