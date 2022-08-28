class UsersController < ApplicationController
  def create
    @users = User.new(users_params)
    @users.user_id = current_user.id
    @users.save
    redirect_to book_path(user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def users_params
    params.require(:users).permit(:title, :image, :body)
  end
end
