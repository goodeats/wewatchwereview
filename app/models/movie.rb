class Movie < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  validates :title, presence: :true
  validates :poster, presence: :true
  validates :rotten_tomatoes_score, presence: :true
  validates :genre, presence: :true
end
