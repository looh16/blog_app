class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.author_id = current_user.id
    @like.post_id = @post.id
    if @like.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to @like.post
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
