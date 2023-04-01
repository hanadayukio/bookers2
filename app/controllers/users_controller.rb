class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end
  
end
