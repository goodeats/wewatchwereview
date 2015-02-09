require 'rails_helper'

Movie.destroy_all

RSpec.feature 'Display Reviews' do
  scenario 'List all reviews' do

    movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

    movie.reviews.create!(title: "Best movie everrr", body: "...and that's all I have to say about that", rating: 5, recommendation: "yes", spoiler?: false)
    movie.reviews.create!(title: "I don't see the hype", body: "he learns to walk", rating: 2, recommendation: "no", spoiler?: true)

    visit "/reviews"

    expect(page).to have_content 'Reviews'
    expect(page).to have_content(/Best/)
    expect(page).to have_content(/hype/)
    expect(page).to have_selector 'div', count: 2
  end

  scenario 'Add a review to a movie' do
    visit '/movies/#{movie.id}/reviews/new'

    fill_in 'Title', with: 'Lt. Dan!'
    fill_in 'body', with: "stole every scene... with no legs!"
    fill_in 'Rating', with: '5'
    fill_in 'recommendation', with: "watch this for Gary Sinese's character"
    fill_in 'spoiler?', with: true
    click_on 'Create Review'

    expect(page).to have_content(/success/)
    expect(page).to have_content 'Reviews'
    expect(page).to have_content(/Best/)
    expect(page).to have_content(/hype/)
    expect(page).to have_content(/Danbody/)
    expect(page).to have_selector 'div', count: 3
  end


end
