class PostsController < ApplicationController


  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    friend_ids = @user.friends.ids
    friend_ids << current_user.id
    @posts = Post.where(user_id: friend_ids)
    if @post.save
      flash.notice = "Post successfully saved"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def like
    post = Post.find(params[:id])
    like = post.likes.new(user_id: current_user.id)
    if like.save
      #nothing for now
    else
      flash[:alert] = "You have already liked that post"
      redirect_to current_user
    end
  end

  def unlike
    post = Post.find(params[:post_id])
    like = post.likes.new(user_id: current_user.id)
    if like.destroy
      #nothing for now
    else
      flash[:alert] = "You have already liked that post"
      redirect_to current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:content,:post_image)
  end
end
