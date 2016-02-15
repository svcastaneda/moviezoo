class User < ActiveRecord::Base
  validates :username, {presence: true, uniqueness: true, length: {maximum: 50}}

  has_secure_password
  validates :password, {presence: true, length: {maximum: 25}, allow_nil: true}
end
