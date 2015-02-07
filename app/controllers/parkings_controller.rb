class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  def index
    @parkings = Parking.all
  end

  def show
  end

  def new
    @parking = Parking.new
  end

  def edit
  end

  def create
    @parking = Parking.new(parking_params)

    respond_to do |format|
      if @parking.save
        format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: 'Parking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @parking.destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: 'Parking was successfully destroyed.' }
    end
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(:name, :address, :user_id, :memo)
  end
end
