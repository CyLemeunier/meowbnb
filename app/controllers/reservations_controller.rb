class ReservationsController < ApplicationController
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

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end

