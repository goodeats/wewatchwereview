require 'rails_helper'

RSpec.feature 'Display Movies' do
  scenario 'List all movies' do
    Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')
    Movie.create!(title: 'Anchorman', poster: "http://content7.flixster.com/movie/11/16/97/11169773_det.jpg", rotten_tomatoes_score: '66%', genre: 'Comedy')
    Movie.create!(title: 'John Wick', poster: "http://content8.flixster.com/movie/11/18/08/11180842_det.jpg", rotten_tomatoes_score: '83%', genre: 'Action')

    visit '/movies'

    expect(page).to have_content 'Movies'
    expect(page).to have_content(/Gump/)
    expect(page).to have_selector 'div', count: 3
  end

  scenario 'Add a movie to the index' do
    visit '/movies/new'

    fill_in 'Title', with: 'The Interview'
    fill_in 'Poster', with: "http://content8.flixster.com/movie/11/17/86/11178658_det.jpg"
    fill_in 'Rotten Tomatoes Score', with: '54%'
    fill_in 'Genre', with: 'Comedy'
    click_on 'Create Movie'

    expect(page).to have_content(/success/)
  end

  scenario 'View a movie' do
    movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

    visit "/movies/#{movie.id}"

    expect(page.find('h1')).to have_content 'Forrest Gump'
    expect(page.find('div')).not_to have_content "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg"
    expect(page.find('div')).to have_content '71%'
    expect(page.find('div')).to have_content 'Drama'
  end

  scenario 'Update a movie' do
    movie = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')

    visit "movies/#{movie.id}/edit"

    fill_in 'Title', with: 'The Interview'
    fill_in 'Poster', with: "http://content8.flixster.com/movie/11/17/86/11178658_det.jpg"
    fill_in 'Rotten Tomatoes Score', with: '54%'
    fill_in 'Genre', with: 'Comedy'
    click_on 'Update Movie'

    expect(page).to have_content(/success/)#i)
    expect(page.find('h1')).to have_content 'The Interview'
    expect(page).to have_content '54%'
    expect(page).to have_content 'Comedy'
  end
end
