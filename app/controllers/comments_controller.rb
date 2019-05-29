class CommentsController < ApplicationController

    def create
        @user = current_user
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
            flash.notice = "Comment successfully saved"
            redirect_to root_path
          else
            puts @comment.errors.messages
            redirect_to root_path
        end
    end


    def destroy

    end


    private

    def comment_params
      params.require(:comment).permit(:comment)
    end


end
