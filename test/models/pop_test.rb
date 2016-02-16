require 'test_helper'

class PopTest < ActiveSupport::TestCase
test "Pop correctly sets default pops" do 
    pop = Pop.create(review_id: 2, user_id: 3)
    assert_equal 0, pop.popped.to_i, 'Pop default is incorrect'
  end
end
