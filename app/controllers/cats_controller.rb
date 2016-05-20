class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  #Redefining these methods to use Log In form in Cats pages
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  #End of Devise methods

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
    @checkin = params[:checkin]
    @checkout = params[:checkout]
  end

  def show
    @reservation = Reservation.new
    @cat = Cat.find(params[:id])
    @all_resa = Reservation.where(cat: @cat)
    @checkin = params[:checkin].blank? ? Date.today.strftime('%Y-%m-%d') : params[:checkin]
    @checkout = params[:checkout].blank? ? Date.today.strftime('%Y-%m-%d') : params[:checkout]
  end

  def display_by_category
    @cats = Cat.where(category: params[:category])
  end

  def display_by_race
    @cats = Cat.where(race: params[:race])
  end

  def display_by_user
    @cats = Cat.where(user: params[:user])
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to user_path(current_user)
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_update_params)
    redirect_to cat_path(@cat)
  end

  private

  def cat_create_params
    params.require(:cat).permit(:name, :category, :race, :year_of_birth, :description, :price_per_day, :photo, :intro, :care_instructions, :diet_instructions, :booking_rules)
  end

  def cat_update_params
    params.require(:cat).permit(:name, :category, :race, :year_of_birth, :description, :price_per_day, :photo, :intro, :care_instructions, :diet_instructions, :booking_rules)
  end

  def cat_params
    params.permit(:city)
  end

end
