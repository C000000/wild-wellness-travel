class RetreatsController < ApplicationController
  def new
    @retreat = Retreat.new
  end

  def create
    @company = current_user.company
    @retreat = @company.retreats.build(retreat_params)
    @retreat.save
    redirect_to company_dashboard_path
  end

  def edit
    @retreat = retreat.find(params[:retreat_id])
  end

  def update
  end

  def destroy
  end

  def retreat_params
    params.require(:retreat).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state, :video, {pictures: []},
      :price, :description)
  end
end
