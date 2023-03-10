class ListsController < ApplicationController
  before_action :set_list, only: :show
  skip_before_action :authenticate_user!, only: :index

  def index
    @lists = List.all
  end

  def show
    # @bookmark = Bookmark.new

    # @review = Review.new(list: @list)
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
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
