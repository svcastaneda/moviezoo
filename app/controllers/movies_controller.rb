class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
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
end
