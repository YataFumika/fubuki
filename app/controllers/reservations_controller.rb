class ReservationsController < ApplicationController
  before_action :reservation_find ,only: [:show,:edit,:update,:destroy]
  before_action :reservation_params ,only: [:create,:update]
  
  def index
    #予約の一覧
    @view_approve_btn = true
    @view_cancel_btn = true
    @demand_count = Reservation.lend_to(current_user).demand.count

    case params[:desp_type].to_i
    when Reservation::DESP_DEMAND[:code]
      @title = Reservation::DESP_DEMAND[:label]
      @reservations = Reservation.lend_to(current_user).demand
      @view_cancel_btn = true

    when Reservation::DESP_APPROVED[:code]
      @title = Reservation::DESP_APPROVED[:label]
      @reservations = Reservation.lend_to(current_user).approved
      @view_cancel_btn = true

    when Reservation::DESP_DENIED[:code]
      @title = Reservation::DESP_DENIED[:label]
      @reservations = Reservation.lend_to(current_user).denied
      @view_cancel_btn = true

    else
      @title = Reservation::DESP_RENT[:label]
      @reservations = Reservation.rent_from(current_user)
      @view_cancel_btn = true
    end
  end
  
  def show
    #予約の詳細
  end

  def new
    @reservation = Reservation.new(
      user_id:current_user.id
      )
    @current_user_name = current_user.name
    @parkings = Parking.where.not(user_id:current_user)
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
    @reservations_user= User.find(@reservation.user_id).name      
    @reservations_parking = Parking.find(@reservation.parking_id).name
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
