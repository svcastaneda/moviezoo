class ErrorsController < ApplicationController
  def unauthorized
    render template: 'errors/401'
  end
end
