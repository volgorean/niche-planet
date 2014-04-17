class ItinerariesController < ApplicationController
  def index
  end

  def new
    if current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @itinerary = @post.itineraries.new
    else
      redirect_to "/"
    end
  end

  def create
    @post = Post.find( itinerary_params[:post_id] )
    @post.itineraries.create( itinerary_params )
    redirect_to "/posts/#{@post.id}/edit"
  end

private
  def itinerary_params
    params.require(:itinerary).permit(:post_id, :how_much, :what, :time, :date)
  end
end
