class RetreatsController < ApplicationController
  def new
    @retreat = Retreat.new
  end

  def create
    @company = current_user.company
    @retreat = @company.retreats.build(retreat_params)
    redirect_to company_dashboard_path if @retreat.save
  end

  def edit
    @retreat = Retreat.find(params[:id])
  end

  def update
  end

  def destroy
    @retreat = Retreat.find(params[:id])
    @retreat.destroy
    redirect_to company_dashboard_path
  end

  def retreat_params
    params.require(:retreat).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state, :video, {pictures: []},
      :price, :description)
  end
end
