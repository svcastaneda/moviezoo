class CommentsController < ApplicationController
  before_filter :determine_scope

  def index
    @commented_thing = @scope
    @comments = @scope.comments.all
  end

  def new
    if current_user
      @commented_thing = @scope
    else
      redirect_to login_path
    end
  end

  def create
    @commented_thing = @scope
    comment = @commented_thing.comments.new(body: params[:comment][:body], user_id: current_user.id)
    if comment.save
      if comment.commentable_type == 'Movie'
        redirect_to movie_comments_path(@commented_thing)
      else
        redirect_to review_comments_path(@commented_thing)
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  protected

    def determine_scope
      if params[:movie_id]
        @scope = Movie.find(params[:movie_id])
      elsif params[:review_id]
        @scope = Review.find(params[:review_id])
      else
        Comment
      end
    end
  private
     def current_user
    User.find_by(id: session[:user_id])
  end

end
