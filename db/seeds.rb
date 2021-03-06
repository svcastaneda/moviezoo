50.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, trusted: false)
end

10.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, trusted: true)
end

# 50.times do
#   Movie.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, year: 2000)
# end

# 30.times do
#   Review.create(user_id: rand(1..50), movie_id: rand(1..50), body: Faker::Lorem.paragraph, rating: rand(1..5))
# end

genres = [
  'Action',
  'Adventure',
  'Animation',
  'Biography',
  'Comedy',
  'Crime',
  'Documentary',
  'Drama',
  'Family',
  'Fantasy',
  'Film-Noir',
  'History',
  'Horror',
  'Music',
  'Musical',
  'Mystery',
  'Romance',
  'Sci-Fi',
  'Sport',
  'Thriller',
  'War',
  'Western'
]

genres.each do |genre|
  Genre.create(title: genre)
end

# 30.times do
#   Classification.create(movie_id: rand(1..50), genre_id:(rand(1..Genre.count)))
# end

# 50.times do
#   # get random movie
#   # create new comment on random movie
#   movie = Movie.find(rand(1..Movie.count))
#   movie.comments.create(body: Faker::Lorem.paragraph, user_id:(rand(1..User.count)))

#   review = Review.find(rand(1..Review.count))
#   review.comments.create(body: Faker::Lorem.paragraph, user_id:(rand(1..User.count)))
# end
