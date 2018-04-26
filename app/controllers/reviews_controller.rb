class ReviewsController < ApplicationController
  before_filter :userfilter

  def userfilter
    if current_user?
      true
    else
      flash[:error] = "You must be logged in to access this section"
      redirect_to signup_path # halts request cycle
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  def create
    @review = Review.new(required_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(@review.product)
    else
      render product_path(@review.product)
    end
  end

  private

  def required_params
    params.require(:review).permit(:description, :rating)
  end
end
