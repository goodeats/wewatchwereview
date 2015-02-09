# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m1 = Movie.create!(title: 'Forrest Gump', poster: "http://content7.flixster.com/movie/11/17/36/11173677_det.jpg", rotten_tomatoes_score: '71%', genre: 'Drama')
m2 = Movie.create!(title: 'Anchorman', poster: "http://content7.flixster.com/movie/11/16/97/11169773_det.jpg", rotten_tomatoes_score: '66%', genre: 'Comedy')
m3 = Movie.create!(title: 'John Wick', poster: "http://content8.flixster.com/movie/11/18/08/11180842_det.jpg", rotten_tomatoes_score: '83%', genre: 'Action')

m1.reviews.create!(title: "Best movie everrr", body: "...and that's all I have to say about that", rating: 5, recommendation: "yes", spoiler?: false)
