class LikesController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @like = @post.likes.new
      end

      def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.new
        @like.author_id = current_user.id
        @like.post_id = @post.id
        if @like.save
            redirect_to user_posts_path(current_user)
        else
          render :new
        end
      end
end
