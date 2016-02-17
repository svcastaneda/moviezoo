module UsersHelper
  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end

  def user_voted?(review_id)
    if current_user
      return true if Pop.find_by(user_id: current_user.id, review_id: review_id)

      Pop.find_by(user_id: User.last.id, review_id: Review.last.id)
    end
  end

  def user_reviewed?(movie_id)
    if current_user
      return true if Review.where(user_id: current_user.id, movie_id: movie_id).count > 0
    end
  end

  def get_pop(review)
    if current_user
      pop = Pop.find_by(user_id: current_user.id, review_id: review.id)
      return pop.id if pop
    end
  end
end
