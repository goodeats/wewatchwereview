require 'rails_helper'

RSpec.describe MoviesController do
  let(:valid_attributes) {
    { title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama' }
  }

  let(:invalid_attributes) {
    { title: nil, poster: nil, rotten_tomatoes_score: nil, genre: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @movies' do
      movies = Movie.all
      get :index
      expect(assigns(:movies)).to eq movies
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @movie' do
      get :new
      expect(assigns(:movie)).to be_a_new Movie
    end
  end

end
