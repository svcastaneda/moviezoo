class Movie < ActiveRecord::Base
  validates_presence_of :title
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :classifications
  has_many :genres, through: :classifications
end
