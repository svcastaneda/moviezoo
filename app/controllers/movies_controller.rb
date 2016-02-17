class MoviesController < ApplicationController
  def index
    @movies = Movie.order('created_at DESC').limit(6)
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
      add_genres(movie.genre, @movie.id) if movie.genre
      redirect_to '/'
    else
      render template: 'movies/new'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.last
    # @user= User.find(@comment.user_id)
    render template: 'movies/show'
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
