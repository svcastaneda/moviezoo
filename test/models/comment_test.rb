require 'test_helper'

class CommentTest < ActiveSupport::TestCase
   test "Comment saves the body correctly" do 
    comment = Comment.create(user_id:2,  body: "Test body")
    assert_equal 'Test body', comment.body, 'Post body does not match'
  end
  test "Comment does not save if it fails validation" do
    comment = Comment.create(user_id:2)
    assert_not comment.valid?, 'Comment must fail save without body'
  end
end
