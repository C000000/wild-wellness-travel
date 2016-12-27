class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @review = current_user.reviews.new(review_params)
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rating, :retreat_id)
  end

end
