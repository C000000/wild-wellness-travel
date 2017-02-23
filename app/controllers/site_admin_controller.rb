class SiteAdminController < ApplicationController
  def property_list
    @properties = Property.all
  end

  def leader_list
    @leaders = RetreatLeader.all
  end

  def retreat_list
    @retreats = Retreat.all
  end

  def activate_property
    @property = Property.find(params[:id])
    @property.active? ? @property.update(active: false) : @property.update(active: true)
    redirect_to property_list_path
  end

  def activate_leader
    @leader = RetreatLeader.find(params[:id])
    @leader.active? ? @leader.update(active: false) : @leader.update(active: true)
    redirect_to leader_list_path
  end

  def activate_retreat
    @retreat = Retreat.find(params[:id])
    @retreat.active? ? @retreat.update(active: false) : @retreat.update(active: true)
    redirect_to retreat_list_path
  end

end
