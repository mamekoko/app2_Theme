class BooksController < ApplicationController

  def index
    @books = Book.all
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
