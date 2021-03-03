class ReviewsController < ApplicationController
  def create
    review = Review.new({
      room_id: review_params[:room],
      star: review_params[:star],
      comment: review_params[:comment],
      name: review_params[:name],
      age: review_params[:age],
      sex: review_params[:sex]
    })
    review.score = Language.get_data(review_params[:comment])
    review.save
    redirect_to reviews_path
  end

  def index
    @reviews = Review.all.order(id: "DESC").page(params[:page]).per(10)
    @review = Review.new
  end

  private
  def review_params
    params.require(:review).permit(:star, :name, :comment, :age, :sex, :room)
  end

end
