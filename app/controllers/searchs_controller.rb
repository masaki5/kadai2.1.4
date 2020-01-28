class SearchsController < ApplicationController

    def search
        method = params[:method]
        model = params[:model]
        search = params[:search]
        if model == "1"
        #@books = Book.search(params[:search])
        @books = Book.search(search,method)
        @book = Book.new
        render 'books/index'
        elsif model == "2"
        #@users = User.search(params[:search])
        @users = User.search(search,method)
        @book = Book.new
        @user = current_user
        render 'users/index'
        end
    end
end
