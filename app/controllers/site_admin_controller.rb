class SiteAdminController < ApplicationController
  def property_list
    @properties = Property.all
  end

  def leader_list
    
  end

  def retreat_list
    @retreats = Retreat.all
  end

end
