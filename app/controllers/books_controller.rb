class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to book_path(@books.id)
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private

  def books_params
    params.require(:book).permit(:title, :image, :body)
  end
end