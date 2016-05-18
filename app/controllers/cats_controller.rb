class CatsController < ApplicationController

  def index
    @users = User.where(city: params[:city])
    raise
    puts @users
    # @cats = Cat.joins(:users).where(users: { city: params[:city] })
    # (city: Cat.user.city = "Paris")
    # redirect_to cats_path(@cats)
  end

  private

  def cat_params
    params.permit(:city)
  end

end
