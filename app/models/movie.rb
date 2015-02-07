class Movie < ActiveRecord::Base

  validates :title, presence: :true
  validates :poster, presence: :true
  validates :rotten_tomatoes_score, presence: :true
  validates :genre, presence: :true
end
