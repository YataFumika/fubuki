class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  # GET /parkings
  # GET /parkings.json
  def index
    @parkings = Parking.owned(@current_user.id)
    list
  end

  def list
    @hash = Gmaps4rails.build_markers(@parkings) do |parking, marker|
      marker.lat parking.latitude
      marker.lng parking.longitude
      marker.json({name: parking.name})
    end

  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new(user_id: @current_user.id)
    @user_name = @current_user.name
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)
    @user_name = @current_user.name
    respond_to do |format|
      if @parking.save
        format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parking }
      else
        format.html { render action: 'new' }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: 'Parking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url }
      format.json { head :no_content }
    end
  end

  private

  def set_parking
    @parking = Parking.includes(:allow_times, :deny_dates).find(params[:id])
    @user_name = @parking.user.try(:name)
  end

  def parking_params
    params.require(:parking).permit(:name,
                                    :address,
                                    :user_id,
                                    :memo,
                                    :photo,
                                    :latitude,
                                    :longitude,
                                    {
                                      allow_times_attributes: [
                                        :id,
                                        :weekday,
                                        :start_time,
                                        :end_time,
                                        :_destroy
                                      ],
                                      deny_dates_attributes: [
                                        :id,
                                        :date,
                                        :_destroy
                                      ]
                                    })
  end
end
