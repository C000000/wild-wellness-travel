class RetreatLeadersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @leaders = RetreatLeader.all
  end

  def show
  end

  def new
    @leader = RetreatLeader.new
  end

  def create
    @leader = RetreatLeader.new(retreat_leader_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def dashboard
    @properties = Property.all
    @property = Property.new
    @retreat = Retreat.new
  end


  private

  def retreat_leader_params
    params.require(:retreat_leader).permit(:first_name, :last_name, :phone_number, 
    :email, :biography, {pictures: []})
  end
end
