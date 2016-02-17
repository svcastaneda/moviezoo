module UsersHelper
  def current_user
    return nil if session[:user_id].nil?
    User.find_by(id: session[:user_id])
  end

  def user_voted?(review_id)
    if current_user
      return true if Pop.where(user_id: current_user.id, review_id: review_id)
    end
  end
end
