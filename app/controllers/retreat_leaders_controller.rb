class RetreatLeadersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @leaders = RetreatLeader.where(active: true)
  end

  def show
  end

  def new
    @leader = RetreatLeader.new
  end

  def create
    @leader = RetreatLeader.new(retreat_leader_params)
    if @leader.save
      redirect_to leader_list_path
    else
      render 'new'
    end
  end

  def edit
    @leader = RetreatLeader.find(params[:id])
  end

  def update
    @leader = RetreatLeader.find(params[:id])
    if @leader.update(retreat_leader_params)
      redirect_to leader_list_path
    else
      render 'edit'
    end
  end

  def destroy
    @leader = RetreatLeader.find(params[:id])
    @leader.destroy
    redirect_to leader_list_path
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
