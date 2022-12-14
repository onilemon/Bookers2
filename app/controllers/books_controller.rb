class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @book_comments = BookComment.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:success] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end

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

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
end