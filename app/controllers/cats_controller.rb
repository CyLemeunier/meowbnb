CATEGORIES = ["Cuddly", "Scary", "Seductive", "Celebrity", "Luxury", "Business", "Drug", "Hunter"]
RACES = ["Siamois", "Persan", "Bengal", "Peterbald", "Unkown"]

class CatsController < ApplicationController

  def index
    @cats = Cat.joins(:user).where(users: { city: params[:city] })
  end

  private

  def cat_params
    params.permit(:city)
  end

end
