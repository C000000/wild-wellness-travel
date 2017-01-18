class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:retreat_leaders, :index, :show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # Retreat Leader
  def new_leader
    @user = current_user
  end

  def create_leader
    @user = User.find(params[:format])
    @user.company_owner = true
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_to new_leader_path
    end
  end

  def retreat_leaders
    @leaders = User.where(company_owner: true)
  end


  private
  
  def property_params
    params.require(:property).permit(:name, :type, :guest_number, :phone_number, 
      :email, :street_address, :country, :city, :state)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :street_address, 
      :country, :city, :state, :profile_picture)
  end
end
