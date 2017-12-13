class FourteenersController < ApplicationController
  before_action :set_fourteener, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def authenticate_admin
    unless current_user.present? and current_user.admin?
      redirect_to new_user_session_url, notice: "You must be an administrator to access this page."
    end
  end

  # GET /fourteeners
  # GET /fourteeners.json
  def index
    # @fourteeners = Fourteener.all
    gon.fourteeners = Fourteener.all
  end

  # GET /fourteeners/1
  # GET /fourteeners/1.json
  def show
    gon.fourteener = Fourteener.find(params[:id])
  end

  # GET /fourteeners/new
  def new
    @fourteener = Fourteener.new
  end

  # GET /fourteeners/1/edit
  def edit
  end

  # POST /fourteeners
  # POST /fourteeners.json
  def create
    @fourteener = Fourteener.new(fourteener_params)

    respond_to do |format|
      if @fourteener.save
        format.html { redirect_to @fourteener, notice: 'Fourteener was successfully created.' }
        format.json { render :show, status: :created, location: @fourteener }
      else
        format.html { render :new }
        format.json { render json: @fourteener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fourteeners/1
  # PATCH/PUT /fourteeners/1.json
  def update
    respond_to do |format|
      if @fourteener.update(fourteener_params)
        format.html { redirect_to @fourteener, notice: 'Fourteener was successfully updated.' }
        format.json { render :show, status: :ok, location: @fourteener }
      else
        format.html { render :edit }
        format.json { render json: @fourteener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fourteeners/1
  # DELETE /fourteeners/1.json
  def destroy
    @fourteener.destroy
    respond_to do |format|
      format.html { redirect_to fourteeners_url, notice: 'Fourteener was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fourteener
      @fourteener = Fourteener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fourteener_params
      params.require(:fourteener).permit(:name, :surname, :elevation_in_feet, :rank, :location_lat, :location_long, :forest, :range, :classification, :exposure, :elevation_gain_in_feet, :round_trip_distance_in_miles, :no_4wd_additional_elevation_in_feet, :no_4wd_additional_distance_in_miles, :route_name, :trailhead_name, :trailhead_lat, :trailhead_long, :four_x_four_required, :additional_info_url, :description, :kml)
    end
end
