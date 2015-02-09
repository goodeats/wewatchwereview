require 'rails_helper'

RSpec.describe 'routes for reviews' do
  it 'routes GET movies/:movie_id/reviews to the reviews controller' do
    expect(get('/reviews')).to route_to('reviews#index')
  end

  # it 'routes GET /reviews/new to the reviews controller' do
  #   expect(get('/reviews/new')).to route_to('reviews#new')
  # end

  # it 'routes GET /reviews/new to the reviews controller' do
  #   expect(get('/reviews/new')).to route_to('reviews#new')
  # end

  # it 'routes GET /reviews/1 to the reviews controller and sets id' do
  #   expect(get('/reviews/1')).to route_to(
  #     controller: 'reviews',
  #     action: 'show',
  #     id: '1'
  #   )
  # end

  # it 'routes GET /reviews/1/edit to the reviews controller and sets id' do
  #   expect(get('reviews/1/edit')).to route_to(
  #     controller: 'reviews',
  #     action: 'edit',
  #     id: '1'
  #   )
  # end

  # it 'routes PATCH /reviews/1 to the reviews controller and sets id' do
  #   expect(patch('reviews/1')).to route_to(
  #     controller: 'reviews',
  #     action: 'update',
  #     id: '1'
  #   )
  # end

  # it 'routes DELETE /reviews/1 to the reviews controller and sets id' do
  #   expect(delete('reviews/1')).to route_to(
  #     controller: 'reviews',
  #     action: 'destroy',
  #     id: '1'
  #   )
  # end

end
