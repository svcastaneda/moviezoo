class Pop < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
end
