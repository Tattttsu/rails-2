class ReservationsController < ApplicationController
  require "date"
  
  def index
    @reservations = Reservation.all
  end
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.start_day.present? && @reservation.finish_day.present? && @reservation.people.present?
      @reservation.total_price = ( @reservation.finish_day-@reservation.start_day) * @reservation.people * @reservation.room.price
    end
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to reservations_path
    else 
      redirect_to "/rooms/#{@reservation.room_id}"
      flash[:danger] = "予約に失敗しました。"
      
    end
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_day, :finish_day, :total_price, :people, :room_id, :user_id)
  end
end
