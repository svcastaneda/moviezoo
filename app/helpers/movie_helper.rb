module MovieHelper
  def movie_exists(imdb)
    movie = Movie.find_by(imdb_id: imdb)
    return movie.id if movie
  end
end
