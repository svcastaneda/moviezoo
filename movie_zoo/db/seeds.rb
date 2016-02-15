50.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, trusted: false)
end

10.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, trusted: true)
end

50.times do
  Movie.create(title: Faker::Book.title, summary: Faker::Lorem.paragraph, year: 2000)
end

30.times do
  Review.create(user_id: rand(0..50), movie_id: rand(0..50), body: Faker::Lorem.paragraph, rating: rand(1..5))
end

20.times do
  Genre.create(title: Faker::Book.genre)
end

30.times do
  Classification.create(movie_id: rand(0..50), genre_id(rand(0..20)))
end

50.times do
  movies.comments.create(body: Faker::Lorem, user_id(rand(0..50)))
  reviews.comments.create(body: Faker::Lorem, user_id(rand(0..50)))
end
