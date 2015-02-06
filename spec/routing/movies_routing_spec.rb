require 'rails_helper'

RSpec.describe 'routes for movies' do
  it 'routes GET /movies to the movies controller' do
    expect(get('/movies')).to route_to('movies#index')
  end

end
