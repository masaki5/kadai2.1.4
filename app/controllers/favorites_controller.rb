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
end
