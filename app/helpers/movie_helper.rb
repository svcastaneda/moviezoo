module MovieHelper
  def movie_exists(imdb)
    movie = Movie.find_by(imdb_id: imdb)
    if movie
      movie.id
    else
      false
    end
  end
end
