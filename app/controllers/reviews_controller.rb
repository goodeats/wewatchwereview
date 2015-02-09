class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
    @movie = Movie.find(params[:article_id])
    @review = @movie.review.create(review_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :recommendation, :spoiler?)
  end

end
