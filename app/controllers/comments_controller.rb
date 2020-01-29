class CommentsController < ApplicationController

    def create
        @books = Book.find(params[:book_id])
        @comment = current_user.comments.new(comment_params)
        @comment.book_id = @books.id
        @comment.save
        #redirect_to book_path(comment.book.id)
        @comments = @books.comments
    end

    def destroy
        @books = Book.find(params[:book_id])
        @comment = current_user.comments.find(params[:id])
        @comment.book_id = @books.id
        #@comment = Comment.find(params[:id])
        #@book = comment.book
        @comment.destroy
        #redirect_to book_path(book.id)
        @comments = @books.comments
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id,:book_id,:comment)
    end
end
