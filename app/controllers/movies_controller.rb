class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = OMDB.id(params[:imdb_id])

    @movie = Movie.new
    @movie.title = movie.title
    @movie.plot = movie.plot
    @movie.year = movie.year
    @movie.poster = movie.poster
    @movie.imdb_id = params[:imdb_id]

    if @movie.save
      add_genres(movie.genre, @movie.id)
      redirect_to '/'
    else
      render template: 'movies/new'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :summary, :year, :poster)
  end

  def add_genres(genres_string, movie_id)
    genres_string.split(', ').each do |genre|
      genre_obj = Genre.find_by(title: genre)
      Classification.create(genre_id: genre_obj.id, movie_id: movie_id)
    end
  end
end
