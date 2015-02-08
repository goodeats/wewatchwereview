require 'rails_helper'

RSpec.feature 'Display Reviews' do
  scenario 'List all reviews' do
    movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

    Review.create!(title: "Best movie everrr", body: "...and that's all I have to say about that", rating: 5, recommendation: "yes", spoiler?: false)
    Review.create!(title: "Too long", body: "I don't get the hype", rating: 2, recommendation: "no", spoiler?: false)

    visit "/movies/#{movie.id}"

    expect(page).to have_content 'Movies'
    expect(page).to have_content(/everrr/)
    expect(page).to have_selector 'article', count: 2
  end

end
