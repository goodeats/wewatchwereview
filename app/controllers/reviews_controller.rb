class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
    if @movie.save
      flash[:notice] = 'Review successfully created.'
      redirect_to movie_path(@movie)
    else
      render :new
    end
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
