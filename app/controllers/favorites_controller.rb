class FavoritesController < ApplicationController
    def update
        book = Book.find(params[:id])
        favorite = current_user.favorites.new(book_id: book.id)
        #book.favorited_by?(current_user)
        favorite.save
        redirect_to request.referrer
    end
    
    def destroy
        book = Book.find(params[:id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        redirect_to request.referrer#book_path(book)
    end
#追記favoriteでは使わなかった。
    private
    def redirect
      case params[:redirect_id].to_i
      when 0
        redirect_to books_path
      when 1
        redirect_to book_path(@book)
      end
    end
end
