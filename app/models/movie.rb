class Movie < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :classifications
  has_many :genres, through: :classifications
end
