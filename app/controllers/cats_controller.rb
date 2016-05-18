class CatsController < ApplicationController

  def index
    @cats = Cat.joins(:user).where(users: { city: params[:city] })
  end

  private

  def cat_params
    params.permit(:city)
  end

end
