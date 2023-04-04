class BooksController < ApplicationController
  def new
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to "/books"
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to "/books/#{@book.id}"
    else
      render :edit
    end
  end
  
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end

