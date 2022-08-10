class RoomsController < ApplicationController
  def search
      @rooms = Room.where("address LIKE ? AND name LIKE?" ,"%#{params[:area]}%", "%#{params[:word]}%" )+ Room.where("address LIKE ? AND intro LIKE?" ,"%#{params[:area]}%", "%#{params[:word]}%" )
      @rooms = @rooms.uniq
  end

  def new
    @room = Room.new
  end

  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new 
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if  @room.save
      flash[:notice] = "ルームを登録しました。"
      redirect_to "/rooms/#{@room.id}"
    else
      flash.now[:danger] = "更新に失敗しました。"
      render "new"
    end
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :intro, :price, :address, :image)
  end
end
