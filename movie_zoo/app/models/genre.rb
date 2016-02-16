class Genre < ActiveRecord::Base
  has_many :classifications
  has_many :movies, through: :classifications

end
