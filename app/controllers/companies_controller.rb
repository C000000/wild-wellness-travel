class CompaniesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def dashboard
  end


  private

  def company_params
    params.require(:company).permit(:name, :phone_number, :email,
      :street_address, :country, :city, :state)
  end
end
