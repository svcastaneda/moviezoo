class Review < ActiveRecord::Base
  validates_presence_of :body

  belongs_to :user
  belongs_to :movie
  has_many :pops
  has_many :comments, as: :commentable
end
