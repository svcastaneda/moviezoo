require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Review saves the body correctly" do 
    movie = Movie.create(title:'Movie title', summary: "Test summary", year: 1990)
    assert_equal 'Test summary', movie.summary, 'Movie summary does not match'
  end

  test "movie does not save if it fails validation" do
    movie = Movie.create(summary: "Test summary", year: 1990)
    assert_not movie.valid?, 'movie must fail save without title'
  end
end
