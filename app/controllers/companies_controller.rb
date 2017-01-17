class CompaniesController < ApplicationController
  def new
  end

  def create
  end

  def update
    @company = Company.find(params[:id])
    redirect_to company_dashboard_path if @company.update(company_params)
  end

  def dashboard
    @company = current_user.company
    @retreat = Retreat.new
  end

  # Retreat Leader
  def new_leader
    @user = current_user
  end


  private

  def company_params
    params.require(:company).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state)
  end
end
