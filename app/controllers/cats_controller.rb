CATEGORIES = ["Cuddly", "Scary", "Seductive", "Celebrity", "Luxury", "Business", "Drug", "Hunter"]
RACES = ["Siamois", "Persian", "Bengal", "Peterbald", "Unkown"]

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
  end

  def index
    @cats = Cat.joins(:user).where(users: { city: params[:city] })
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def display_by_category
    @cats = Cat.where(category: params[:category])
  end

  def display_by_race
    @cats = Cat.where(race: params[:race])
  end

  private

  def cat_create_params
    params.require(:cat).permit(:name, :category, :race, :year_of_birth, :description, :price_per_day, :photo)
  end

  def cat_params
    params.permit(:city)
  end

end
