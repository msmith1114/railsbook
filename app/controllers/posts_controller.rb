class PostsController < ApplicationController

  def create
    user = current_user
    @post = user.posts.new(post_params)
    @post.save
    flash.notice = "Post successfully saved"
    redirect_to current_user
  end

  def like
    post = Post.find(params[:post_id])
    puts post
    like = post.likes.new(user_id: current_user.id)
    if like.save
      #nothing for now
    else
      flash[:alert] = "You have already liked that post"
      redirect_to current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
