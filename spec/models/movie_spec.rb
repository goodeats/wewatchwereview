require 'rails_helper'

RSpec.describe Movie do
  describe '.create' do
    it 'creates a new movie' do
      expect(Movie.create()).to be_a Movie
    end

    it 'is valid with all requirements' do
      expect(Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')).to be_valid
    end
  end
end
