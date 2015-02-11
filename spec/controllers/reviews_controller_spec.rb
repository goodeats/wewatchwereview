require 'rails_helper'

Movie.destroy_all

RSpec.describe ReviewsController do
  let(:valid_attributes) {
    { title: "Best movie everrr", body: "...and that's all I have to say about that", rating: 5, recommendation: "yes", spoiler: false }
  }

  movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index, movie_id: movie.id
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index, movie_id: movie.id
      expect(response).to render_template('index')
    end

    it 'assigns @reviews' do
      reviews = Review.all
      get :index, movie_id: movie.id
      expect(assigns(:reviews)).to eq reviews
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do

      Movie.destroy_all

      movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

      get :new, movie_id: movie.id
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new, movie_id: movie.id
      expect(response).to render_template('new')
    end

    it 'assigns @review' do
      get :new, movie_id: movie.id
      expect(assigns(:review)).to be_a_new Review
    end
  end

end
