class ResultsController < ApplicationController
  def index

    p '*********************************'
    p params[:movie][:title]
    p '*********************************'
    p @movies = Omdb::Api.new.search(params[:movie][:title]).first[1]
    p '*********************************'
  end
end
