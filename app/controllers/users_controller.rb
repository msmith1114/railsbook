class UsersController < ApplicationController
    before_action :logged_in?


    def show
        @user = User.find(params[:id])
        @post = Post.new
        @comment = Comment.new
        @posts = @user.posts.order! 'created_at DESC'
    end

    def search
        @users = User.where('first_name LIKE ?', "%#{params[:q]}%")
    end 

    private

    def logged_in?
        unless user_signed_in?
            redirect_to sign_up_path
        end
    end

end
