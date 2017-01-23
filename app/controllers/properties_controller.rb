class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:retreat_leaders, :index, :show]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to leader_dashboard_path
    else
      render 'leader_dashboard'
    end
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

  def leader_dashboard
    @properties = current_user.properties
    @retreat = Retreat.new
  end


  private
  
  def property_params
    params.require(:property).permit(:name, :property_type, :guest_number, :phone_number, 
    :email, :street_address, :country, :city, :state, :description, {pictures: []})
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :street_address, 
      :country, :city, :state, :profile_picture, :biography)
  end
end
