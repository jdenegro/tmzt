require 'json'
require 'open-uri'

class ListsController < ApplicationController
  before_action :set_list, only: :show
  skip_before_action :authenticate_user!, only: :index
  # TODO: validate @Lists to show on view

  def index
    # @movies = movie.all
    # raise
    @lists = List.all

    # TODO: Save URL with API Key in variable
    # TODO: Use Open URI to access data from URL, use movie_serialized
    # TODO: Parse data into JSON.
    url = "https://api.themoviedb.org/3/discover/movie?api_key=2d904f2ccbadaa1303f4b2e7ea571a93&"
    @movies = JSON.parse(URI.open(url).read)["results"]
    # movie_serialized = URI.open(url).read
    # movie = JSON.parse(movie_serialized)

  end

  def show
    @bookmark = Bookmark.new

    @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def set_list
    # @list = List.find(params[:id])
    @list = List.find_by(id: params[:id])
      unless @list
        flash[:error] = "List not found"
        # redirect_to root_path
      end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
