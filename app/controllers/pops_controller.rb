class PopsController < ApplicationController
  def create
    Pop.create!(popped: params[:value], user_id: current_user.id, review_id: params[:review_id])
  end

  def update
    pop = Pop.where(review_id: params[:review_id], user_id: current_user.id)
    pop.popped = params[:value]
    redirect_to '/'
  end

  private

  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
    redirect_to movie_path(params[:movie_id])
  end
end
