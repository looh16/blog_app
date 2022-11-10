class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
        redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:text)
  end
end
