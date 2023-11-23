class BookmarksController < ApplicationController
  before_action :set_bookmarks, only: [:show]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @list = List.new(list_params)
    @list.movie = @movie
    if @list.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmarks
    params.require(:list, :movie).permit(:name, :overview, :rating, :poster_url, :title)
  end
end
