require 'rails_helper'

RSpec.describe Movie do
  describe '.create' do
    it 'creates a new movie' do
      expect(Movie.create()).to be_a Movie
    end

    # it 'is invalid without a body' do
    #   expect(Movie.create(title: 'My title')).not_to be_valid
    # end

    # it 'is invalid without a title' do
    #   expect(Movie.create(body: 'My body')).not_to be_valid
    # end

    # it 'is valid with a body and a title' do
    #   expect(Movie.create(title: 'My title', body: 'My body')).to be_valid
    # end
  end
end
