CATEGORIES = ["Cuddly", "Scary", "Seductive", "Celebrity", "Luxury", "Business", "Drug", "Hunter"]
RACES = ["Siamois", "Persan", "Bengal", "Peterbald", "Unkown"]

class CatsController < ApplicationController

  def new
    @cat = Cat.new
  end

  def create
    @user = current_user
    @cat = Cat.new(cat_create_params)
    @cat.user = @user
    if @cat.save
      redirect_to user_path(@user)
    else
      render :new
    end

  def index
    @cats = Cat.joins(:user).where(users: { city: params[:city] })
  end

  private

  def cat_create_params
    params.require(:cat).permit(:name, :category, :race, :year_of_birth, :description, :price_per_day, :photo)
  end

  def cat_params
    params.permit(:city)
  end

end
