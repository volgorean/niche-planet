class NichesController < ApplicationController
  def show
    @posts = Post.where(niche_id: params[:id])
  end

  def new
    if user_signed_in?
      @niche = Niche.new
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    Niche.create(params.require(:niche).permit(:name))
    redirect_to "/"
  end
end
