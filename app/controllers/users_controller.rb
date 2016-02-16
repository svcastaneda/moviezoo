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
    @user = User.find_by(id: params[:id])
    
    if @user && @user == current_user
      render template: 'users/edit'
    else
      redirect_to '/401'
    end
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

  def login
    if current_user
      redirect_to '/'
    else
      render template: 'users/login'
    end
  end

  def new_session
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ['Login credentials not valid.']
      render template: 'users/login'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
