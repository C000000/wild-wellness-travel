class RetreatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @retreats = Retreat.all
  end

  def show
    @retreat = Retreat.find(params[:id])
    @property = @retreat.property
    @booking = Booking.new
  end

  def new
  end

  def create
    @retreat = Retreat.new(retreat_params)
    if @retreat.save
      redirect_to leader_dashboard_path
    else
      raise
    end
  end

  def edit
    @retreat = Retreat.find(params[:id])
  end

  def update
    @retreat = Retreat.find(params[:id])
    redirect_to edit_retreat_path if @retreat.update(retreat_params)
  end

  def destroy
    @retreat = Retreat.find(params[:id])
    @retreat.destroy
    redirect_to root_path
  end

  def retreat_params
    params.require(:retreat).permit(:name, :property_id, :start_date, :end_date, :phone_number, 
      :email, :available_spots, :street_address, :country, :city, :state, :video, 
      {pictures: []}, :price, :description)
  end
end
