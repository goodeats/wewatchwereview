require 'rails_helper'

RSpec.describe Review do
  describe '.create' do
    it 'creates a new review' do
      expect(Review.create()).to be_a Review
    end

    it 'is valid with all requirements' do
      expect(Review.create!(title: "Best movie everrr", body: "...and that's all I have to say about that", rating: 5, recommendation: "yes", spoiler?: false)).to be_valid
    end
  end
end
