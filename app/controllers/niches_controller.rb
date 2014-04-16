class NichesController < ApplicationController
  def show
    @posts = Post.where(niche_id: params[:id])
    @niche = Niche.find(params[:id])
  end

  def new
    if user_signed_in?
      @niche = Niche.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    Niche.create( niche_params )
    redirect_to "/"
  end

private
  def niche_params
    params.require(:niche).permit(:name, :image)
  end
end
