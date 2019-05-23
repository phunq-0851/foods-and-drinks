class SearchController < ApplicationController
  def index
    @products = @q.result.includes(:category)
  end
end
