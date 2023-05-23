class BooksController < ApplicationController

before_action :baria_book, only: [:edit]



  def index
    @books = Book.all
    @book  = Book.new
    @user = current_user

  end

  def create


    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update

    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy



    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def baria_book
    unless Book.find(params[:id]).user.id.to_i == current_user.id
        redirect_to books_path
    end
  end


end
