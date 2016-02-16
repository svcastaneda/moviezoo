require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "Review saves the body correctly" do 
    review = Review.create(user_id:2, movie_id: 3, body: "Test body", rating: 5)
    assert_equal 'Test body', review.body, 'Post body does not match'
  end
  test "Review does not save if it fails validation" do
    review = Review.create(user_id:2, movie_id: 3, rating: 5)
    assert_not review.valid?, 'Review must fail save without body'
  end
end
