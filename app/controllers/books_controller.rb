class BooksController < ApplicationController
  def index
    @search = Book.search(params[:q])
    @books = @search.result.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render action:'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.title = book_params['title']
    @book.isbn = book_params['isbn']
    if @book.save
      flash.notice = '保存しました。'
      redirect_to action: :show
    else
      flash.alert = '保存に失敗しました。もう一度ISBNを確認してください。'
      redirect_to action: :edit
    end
  end

  def book_params
    params.require(:book).permit(:title, :isbn)
  end
end
