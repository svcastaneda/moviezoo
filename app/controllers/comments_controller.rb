class CommentsController < ApplicationController
  before_filter :determine_scope

  def index
    @commented_thing = @scope
    @comments = @scope.comments.all
  end

  def new
  end

  def create
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
end
