class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)

    if @review.save
      flash[:notice] = 'Review successfully created.'
      redirect_to movie_path(@movie)
    else
      flash[:notice] = 'Review not successfully created.'
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    review = @movie.reviews.create(review_params)
  end

  def update
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.create(review_params)

    if @review.update_attributes(movie_params)
      flash[:notice] = 'Movie successfully updated.'
      redirect_to movie_review_path(@movie)
    else
      flash[:notice] = 'Movie not successfully updated.'
      render :edit
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
