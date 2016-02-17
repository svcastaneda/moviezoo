class ReviewsController < ApplicationController

  def create
    movie = Movie.find_by(id: params[:movie_id])

    review = Review.new(body: review_params[:body], rating: review_params[:rating], user_id: current_user.id, movie_id: movie.id)
    
    if review.save
      if request.xhr?
        render partial: 'movies/review_partial', locals: {review: review, movie: movie}, layout: false
      else
        redirect_to movie_path(movie)
      end
    else
      # @errors = @review.errors.full_messages
      # render 'movies/show', locals: {:movie => movie}
      redirect_to movie_path(movie)
    end
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
