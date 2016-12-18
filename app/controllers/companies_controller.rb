class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @user = current_user
    @user.create_company(company_params)
    redirect_to company_dashboard_path
  end

  def dashboard
    @company = current_user.company
  end


  private

  def company_params
    params.require(:company).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state)
  end
end
