class RetreatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
      redirect_to retreat_list_path
    else
      raise
    end
  end

  def edit
    @retreat = Retreat.find(params[:id])
  end

  def update
    @retreat = Retreat.find(params[:id])
    if @retreat.update(retreat_params)
      redirect_to edit_retreat_path
    else
      render 'edit'
    end
  end

  def destroy
    @retreat = Retreat.find(params[:id])
    @retreat.destroy
    redirect_to root_path
  end

  def retreat_params
    params.require(:retreat).permit(:name, :property_id, :start_date, :end_date, :phone_number, 
      :email, :available_spots, :video, :price, :description)
  end
end
