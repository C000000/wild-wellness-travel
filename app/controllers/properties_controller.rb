class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to edit_property_path(@property)
    else
      render 'edit'
    end
  end

  def destroy
  end


  private
  
  def property_params
    params.require(:property).permit(:name, :property_type, :guest_number, :phone_number, 
    :email, :street_address, :country, :city, :state, :description, {pictures: []})
  end
end
