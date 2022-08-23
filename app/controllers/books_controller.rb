class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path
  end
  
  def index
  end

  private

  def books_params
    params.require(:book).permit(:title, :image, :body)
  end
end