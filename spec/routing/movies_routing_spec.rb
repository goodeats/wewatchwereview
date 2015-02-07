require 'rails_helper'

RSpec.describe 'routes for movies' do
  it 'routes GET /movies to the movies controller' do
    expect(get('/movies')).to route_to('movies#index')
  end

  it 'routes GET /movies/new to the movies controller' do
    expect(get('/movies/new')).to route_to('movies#new')
  end

  it 'routes GET /movies/1 to the movies controller and sets id' do
    expect(get('/movies/1')).to route_to(
      controller: 'movies',
      action: 'show',
      id: '1'
    )
  end


end
