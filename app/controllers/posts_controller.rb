class PostsController < ApplicationController

  def create
    user = current_user
    @post = user.posts.new(post_params)
    @post.save
    flash.notice = "Post successfully saved"
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
