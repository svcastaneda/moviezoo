class ReviewsController < ApplicationController

  def create
    movie = Movie.find_by(id: params[:movie_id])

    review = Review.create(body: review_params[:body], rating: review_params[:rating], user_id: current_user.id, movie_id: movie.id)
    redirect_to movie_path(movie)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
