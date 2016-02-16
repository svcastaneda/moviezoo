class User < ActiveRecord::Base
  has_many :comments
  has_many :reviews
  has_many :pops

  validates :username, {presence: true, uniqueness: true, length: {maximum: 50}}

  has_secure_password
  validates :password, {presence: true, length: {maximum: 25}, allow_nil: true}
end
