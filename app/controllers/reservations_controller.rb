class ReservationsController < ApplicationController
  before_action :reservation_find ,only: [:show,:edit,:destroy]
  before_action :reservation_params ,only: [:create,:update]
  
  def index
    #予約の一覧 貸す予定（Reservation.parking.user = login_user） 借りる予定（Reservation.user = login_user）
  end
  
  def show
    #予約の詳細
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    if @reservation.create(reservation_params)
      redirect_to "index" , notise:"予約申請を完了しました。。。"
    else
      redirect_to "new", alert:"予約神聖に失敗しました。。。"
    end
  end
  
  def edit
    
  end
  
  def update
  end

  def destroy
  end

  private
  
  def reservation_find
    @reservation = Reservation.find(params[:id])
  end
  
  def  reservation_params
    params.require(:reservation).permit(:user_id,:parking_id,:start_at,:end_at,:status)
  end

end