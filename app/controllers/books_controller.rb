class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @title = @book.title
  end

  def new
    @book = Book.new
    @title = "New book"
  end

  def create
    @book = Book.new(params[:book])
    @book.read_pages = 0
    if @book.save
      flash[:success] = "Successfully added a new book!"
      redirect_to @book
    else
      @title = "New book"
      render 'new'
    end
  end

end
