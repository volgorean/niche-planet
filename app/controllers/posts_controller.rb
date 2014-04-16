class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    @user = User.find(current_user.id)
    @user.posts.create(params.require(:post).permit(:title, :description))
    redirect_to "/"
  end

  def show
    @post = Post.find(params[:id])
  end

end
