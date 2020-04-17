class FavoritesController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  def create
    @favorite = current_user.favorites.create(favorite_params)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find_by(favorite_params, user_id: current_user.id)
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end
  def favorite_params
    params.permit(:book_id)
  end
end