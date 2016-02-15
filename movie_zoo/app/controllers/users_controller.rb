class UsersController < ApplicationController
  protect_from_forgery

  def temp
    render template: 'temp'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render template: 'users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to '/'
    else
      render template: 'users/edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to '/' #TBD
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def current_user
    User.find(session[:user_id])
  end
end
