class MealPlansController < ApplicationController
  before_action :set_retreat, only: [:new, :create, :update, :destroy]
  def new
    @meal = MealPlan.new
    @meals = @retreat.meal_plans
  end

  def create
    @retreat.meal_plans.create(meal_plan_params);
    redirect_to new_retreat_meal_plan_path(@retreat)
  end

  def edit
  end

  def update
    @retreat.meal_plans.find(params[:id]).update(meal_plan_params)
    redirect_to new_retreat_meal_plan_path(@retreat)
  end

  def destroy
    MealPlan.find(params[:id]).destroy
    redirect_to new_retreat_meal_plan_path(@retreat)
  end


  private

  def set_retreat
    @retreat = Retreat.find(params[:retreat_id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:name)
  end
end
