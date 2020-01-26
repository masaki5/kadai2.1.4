class CommentsController < ApplicationController

    def create
        #book = Book.find(params[:id])
        comment = current_user.comments.new(comment_params)
        #comment.book_id = book.id
        comment.save
        redirect_to book_path(comment.book.id)
    end

    def destroy
        comment = Comment.find(params[:id])
        book = comment.book
        comment.destroy
        redirect_to book_path(book.id)
    end
        

    private
    def comment_params
        params.require(:comment).permit(:user_id,:book_id,:comment)
    end
end
