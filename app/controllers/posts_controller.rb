class PostsController < ApplicationController
  def index
    @niches = Niche.all
    @coords = []
    Post.all.each do |post|
      @coord = []
      post.itineraries.each do |itinerary|
        if itinerary.lat && itinerary.lng
          @coord << {lat: itinerary.lat, lng: itinerary.lng}
        end
      end
      @coords << @coord
    end
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
    @post = @user.posts.create( posts_params )
    redirect_to "/users/#{current_user.id}/posts/#{@post.id}/itineraries/new"
  end

  def show
    @post = Post.find(params[:id])
    @itineraries = Itinerary.where(post_id: params[:id])
  end

  def edit
    if current_user.id == Post.find(params[:id]).user_id
      @post = Post.find(params[:id])
      @niches = []
      Niche.all.each do |niche|
        @niches << [niche.name, niche.id]
      end
    elsif !user_signed_in?
      redirect_to "/users/sign_in"
    else
      redirect_to "/"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update( posts_params )
    redirect_to "/posts/#{params[:id]}/edit"
  end

private
  def posts_params
    params.require(:post).permit(:title, :description, :niche_id, :image)
  end

end
