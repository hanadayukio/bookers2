class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def index
    @users = User.all
    @book_new = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
  end
  
    private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
