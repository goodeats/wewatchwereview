class Review < ActiveRecord::Base

  belongs_to :movie

  validates :title, presence: :true
  validates :body, presence: :true
  validates :rating, presence: :true
  validates :recommendation, presence: :true
  validates :spoiler?, :inclusion => {:in => [true, false]}

end
