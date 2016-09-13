class Api::BooksController < ApplicationController
  protect_from_forgery except: :create

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(get_params)
    if @book.valid?
      @book.save
    end
    @book
  end

  private
    def get_params
      params.permit(:book_name, :isbn, :stocks)
    end
end
