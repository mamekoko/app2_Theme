class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    end
  end

  def show
  end
  
  def edit
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image) 
  end
  
  
end
