class RetreatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @retreats = Retreat.all
  end

  def show
    @retreat = Retreat.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def create
    @property = current_user.properties.first
    @retreat = @property.retreats.new(retreat_params)
    raise
    redirect_to root_path if @retreat.save
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
    params.require(:retreat).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state, :video, {pictures: []},
      :price, :description)
  end
end
