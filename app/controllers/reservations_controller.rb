class ReservationsController < ApplicationController

  def index
    # lister les réservations du cat qui appartient au current_user
    @reservations_own_cats = Reservation.where(cat: current_user.cats)
    # lister les réservations faites par le current_user
    @reservations_done_user = Reservation.where(user: current_user)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.price = (@reservation.end_date - @reservation.start_date).to_i * @cat.price_per_day
    @reservation.cat = @cat
    @reservation.user = current_user
    if @reservation.save
      redirect_to user_path(current_user)
    else
      render 'cats/show'
    end
  end

  def edit
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_update_params)
      redirect_to user_path(current_user)
    end

  end

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

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def reservation_update_params
    params.require(:reservation).permit(:user_review, :user_rating)
  end

end

