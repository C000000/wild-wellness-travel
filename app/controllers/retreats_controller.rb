class RetreatsController < ApplicationController
  def new
    @retreat = Retreat.new
  end

  def create
    @company = current_user.company
    @retreat = @company.retreats.create(retreat_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
