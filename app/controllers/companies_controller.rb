class CompaniesController < ApplicationController
  def new
    redirect_to company_dashboard_path if current_user.company
    @company = Company.new
  end

  def create
    @user = current_user
    @user.create_company(company_params)
    redirect_to company_dashboard_path
  end

  def update
    @company = Company.find(params[:id])
    redirect_to company_dashboard_path if @company.update(company_params)
  end

  def dashboard
    @company = current_user.company
    @retreat = Retreat.new
  end


  private

  def company_params
    params.require(:company).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state)
  end
end
