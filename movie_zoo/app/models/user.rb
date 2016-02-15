class User < ActiveRecord::Base
  has_many :comments
  has_many :reviews
  has_many :pops
end
