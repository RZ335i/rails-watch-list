class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
