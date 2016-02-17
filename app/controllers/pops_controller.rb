class PopsController < ApplicationController
  def create
    Pop.create!(popped: params[:value], user_id: current_user.id, review_id: params[:review_id])
  end

  def update
    pop = Pop.where(review_id: params[:review_id], user_id: current_user.id)

    pop.popped = params[:value]
  end

  private

  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end
end
