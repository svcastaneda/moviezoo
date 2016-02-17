class PopsController < ApplicationController
  def create
    review = Review.find_by(id: params[:review_id])
    pop = Pop.new(popped: params[:value], user_id: current_user.id, review_id: params[:review_id])
    if params[:type] == 'upvote'
      pop.popped = 1
    elsif params[:type] == 'downvote'
      pop.popped = -1
    end
    pop.save
    redirect_to movie_path(review.movie_id)
  end

  def update
    review = Review.find_by(id: params[:review_id])
    pop = Pop.find_by(user_id: current_user.id, review_id: params[:review_id])
    if params[:type] == 'upvote'
      pop.popped = 1
    elsif params[:type] == 'downvote'
      pop.popped = -1
    end
    pop.save
    redirect_to movie_path(review.movie_id)
  end

  private

  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end
end
