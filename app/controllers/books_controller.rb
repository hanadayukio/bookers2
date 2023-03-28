class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.new(book_params)
    @books.save
    redirect_to books_path
  end

  def show
    @books = Book.find(params[:id])
  end

  def destroy
  end
  
  private
  def book_params
  params.require(:book).permit(:title, :body)
  end
end

