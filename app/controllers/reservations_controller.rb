class ReservationsController < ApplicationController
  before_action :reservation_find ,only: [:show,:edit,:update,:destroy]
  before_action :reservation_params ,only: [:create,:update]
  
  def index
    session[:user_id] = User.first.id
    #予約の一覧
    # 借りる予定 rent
    @reservations_rent = Reservation.rent(current_user)

    # 貸す予定 lend
    @reservations_lend = Reservation.lend(current_user)
  end
  
  def show
    #予約の詳細
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path , notise:"予約申請を完了しました。。。"
    else
      redirect_to new_reservation_path , alert:"予約神聖に失敗しました。。。"
    end
  end
  
  def edit
    
  end
  
  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path , notise:"予約申請を変更しました。。。"
    else
      redirect_to edit_reservation_path , alert:"予約申請変更に失敗しました。。。"
    end
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
