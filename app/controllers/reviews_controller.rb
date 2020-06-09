class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :destroy]

  def new
    @review = Review.new
    @property = Property.find(params[:property_id])
  end

  def create
    @review = Review.new(review_params)
    @property = Property.find(params[:property_id])
    @review.property = @property
    @review.user = current_user
    if @review.save
      redirect_to @property
    else
      flash[:alert] = "Please fill in all fields"
      render :new
    end
  end

  def edit
    @property = Property.find(params[:property_id])
  end

  def update
    @review.update(review_params)
    redirect_to @property
  end

  def destroy
    @property = @review.property
    @review.destroy
    redirect_to @property
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :stars, :checkin, :checkout, photos: [])
  end

end
