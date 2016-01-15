class BooksController < ApplicationController
  def index
    @search = Book.search(params[:q])
    @books = @search.result.page(params[:page])
    respond_to do |f|
      f.html
      f.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html{redirect_to @book }
      else
        format.html{render action:'new'}
      end
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
