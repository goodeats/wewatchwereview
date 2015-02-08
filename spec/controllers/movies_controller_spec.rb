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

  describe 'GET show' do
    it 'has a 200 status code' do
      movie = Movie.create!(valid_attributes)
      get :show, id: movie
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      movie = Movie.create!(valid_attributes)
      get :show, id: movie
      expect(response).to render_template('show')
    end

    it 'assigns @movie' do
      movie = Movie.create!(valid_attributes)
      get :show, id: movie
      expect(assigns(:movie)).to eq movie
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new movie' do
        expect {
          post :create, movie: valid_attributes
        }.to change(Movie, :count).by 1
      end

      it 'assigns @movie' do
        post :create, movie: valid_attributes
        expect(assigns(:movie)).to be_an Movie
        expect(assigns(:movie)).to be_persisted
      end

      it 'redirects to the created movie' do
        post :create, movie: valid_attributes
        expect(response).to redirect_to(Movie.last)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @movie, but does not save a new movie' do
        post :create, movie: invalid_attributes
        expect(assigns(:movie)).to be_a_new Movie
      end

      it 're-renders the new template' do
        post :create, movie: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      movie = Movie.create!(valid_attributes)
      get :edit, id: movie
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      movie = Movie.create!(valid_attributes)
      get :edit, id: movie
      expect(response).to render_template('edit')
    end

    it 'assigns @movie' do
      movie = Movie.create!(valid_attributes)
      get :edit, id: movie
      expect(assigns(:movie)).to eq movie
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) {
        { title: 'The Interview', poster: "http://content8.flixster.com/movie/11/17/86/11178658_det.jpg", rotten_tomatoes_score: '54%', genre: 'Comedy' }
      }

      it 'updates the requested movie' do
        movie = Movie.create!(valid_attributes)
        patch :update, id: movie, movie: new_attributes
        movie.reload
        expect(movie.title).to eq new_attributes[:title]
        expect(movie.poster).to eq new_attributes[:poster]
        expect(movie.rotten_tomatoes_score).to eq new_attributes[:rotten_tomatoes_score]
        expect(movie.genre).to eq new_attributes[:genre]
      end

      it 'assigns @movie' do
        movie = Movie.create!(valid_attributes)
        patch :update, id: movie, movie: new_attributes
        expect(assigns(:movie)).to eq movie
      end

      it 'redirects to the movie' do
        movie = Movie.create!(valid_attributes)
        patch :update, id: movie, movie: new_attributes
        expect(response).to redirect_to movie
      end
    end

    context 'with invalid attributes' do
      it 'assigns @movie' do
        movie = Movie.create!(valid_attributes)
        patch :update, id: movie, movie: invalid_attributes
        expect(assigns(:movie)).to eq movie
      end

      it 're-renders the edit template' do
        movie = Movie.create!(valid_attributes)
        patch :update, id: movie, movie: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

end
