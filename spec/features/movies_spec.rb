require 'rails_helper'

RSpec.feature 'Display Movies' do
  scenario 'List all movies' do
    Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rt_score: '71%', genre: 'Drama')
    Movie.create!(title: 'Anchorman', poster: "http://content7.flixster.com/movie/11/16/97/11169773_det.jpg", rt_score: '66%', genre: 'Comedy')
    Movie.create!(title: 'John Wick', poster: "http://content8.flixster.com/movie/11/18/08/11180842_det.jpg", rt_score: '83%', genre: 'Action')

    visit '/movies'

    expect(page).to have_content 'Movies'
    expect(page).to have_selector 'div', count: 3

  end

end
