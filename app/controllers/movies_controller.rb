class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:notice] = 'Movie successfully created.'
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      flash[:notice] = 'Movie successfully updated.'
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :poster, :rotten_tomatoes_score, :genre)
    end
end
