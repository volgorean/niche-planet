class ItinerariesController < ApplicationController
  def index
  end

  def new
    if current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @itineraries = @post.itineraries
      @itinerary = @post.itineraries.new
      @coords = []
      @coord = []
      @itineraries.each do |itinerary|
        if itinerary.lat && itinerary.lng
          @coord << {lat: itinerary.lat, lng: itinerary.lng}
        end
      end
      @coords << @coord
    else
      redirect_to "/"
    end
  end

  def create
    @post = Post.find( itinerary_params[:post_id] )
    @post.itineraries.create( itinerary_params )
    redirect_to "/users/#{current_user.id}/posts/#{@post.id}/itineraries/new"
  end

private
  def itinerary_params
    params.require(:itinerary).permit(:post_id, :how_much, :what, :time, :date, :lat, :lng, :order)
  end
end
