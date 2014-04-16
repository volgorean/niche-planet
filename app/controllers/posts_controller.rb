class PostsController < ApplicationController
  def index
    @niches = Niche.all
  end

  def new
    if user_signed_in?
      @post = Post.new
      @niches = []
      Niche.all.each do |niche|
        @niches << [niche.name, niche.id]
      end
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    @user = User.find(current_user.id)
    @user.posts.create(params.require(:post).permit(:title, :description, :niche_id))
    redirect_to "/"
  end

  def show
    @post = Post.find(params[:id])
  end

end