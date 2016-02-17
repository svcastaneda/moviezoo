class ResultsController < ApplicationController
  def index
    @movies = Omdb::Api.new.search(params[:movie][:title]).first[1]
  end
end
