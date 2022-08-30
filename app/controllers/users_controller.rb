class UsersController < ApplicationController
  def create
    @users = User.new(user_params)
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
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
