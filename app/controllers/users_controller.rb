class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
