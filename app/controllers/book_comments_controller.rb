class BookCommentsController < ApplicationController
  def create
    book = book.find(params[:book_id])
    comment = current_user.book_commment.new(book_comment_params)
    comment.book_commment_id= book_comment.id
    comment.save
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
