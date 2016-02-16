class Movie < ActiveRecord::Base
  validates_presence_of :title, :year, :imdb_id
  validates :imdb_id, {uniqueness: true}
  has_many :comments, as: :commentable
  has_many :reviews
  has_many :classifications
  has_many :genres, through: :classifications
end
