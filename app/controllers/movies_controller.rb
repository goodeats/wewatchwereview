require 'byebug'

class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

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

  def destroy
    Movie.find(params[:id]).destroy
    flash[:notice] = 'Movie successfully deleted.'
    redirect_to movies_path
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :poster, :rotten_tomatoes_score, :genre)
    end

    def correct_user
      @movie = current_user.movies.find_by(id: params[:id])
      redirect_to movies_path, notice: "Not authorized to edit this movie" if @movie.nil?
    end

end
