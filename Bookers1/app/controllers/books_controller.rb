class BooksController < ApplicationController
  def new
  end

  def index
  	@book = Book.new
  	#空のBookデータ
  	@books = Book.all
  	#Bookの全データ
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'books/index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       redirect_to books_path
     else
       render :edit
     end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end