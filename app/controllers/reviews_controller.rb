class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.score = Language.get_data(review_params[:comment])
    if @review.save
      render "add_index"
    else
      render "review_errors"
    end
  end

  def index
    @review = Review.new
    @reviews = Review.review_search(review_search_params)
                    .order(id: "DESC").page(params[:page]).per(8)
  end

  private
  def review_search_params
    params.fetch(:review_search, {}).permit(star: [], age: [], room: [], sex: [])
  end
  def review_params
    params.require(:review).permit(:star, :name, :age, :comment, :sex, :room_id, :score)
  end
end
