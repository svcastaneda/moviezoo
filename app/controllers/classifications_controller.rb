class ClassificationsController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @genre = Genre.find(params[:id])
    movie_ids = Classification.where(genre_id: params[:id]).pluck('movie_id')
    @movies = Movie.find(movie_ids)
  end
end
