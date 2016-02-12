class BooksController < ApplicationController
  def index
    @search = Book.search(params[:q])
    @books = @search.result.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    if @book.user_id == 1
      flash.notice = '借りれます'
    else
      flash.notice = '貸出中です'
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash.notice = '保存しました。'
      redirect_to @book
    else
      flash.alert = '保存に失敗しました。もう一度確認してください。'
      redirect_to :back
    end
  end

  def get_info
    Amazon::Ecs.debug = true
    res = Amazon::Ecs.item_search(params[:isbn],
                                  :search_index   => 'Books',
                                  :response_group => 'Medium',
                                  :country        => 'jp'
    )
    info = {'Title' => res.first_item.get('ItemAttributes/Title'),
            'MediumImage' => res.first_item.get('MediumImage/URL')}
    render json: info
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.all
  end

  def update
    @book = Book.find(params[:id]).update(book_params)
    @book.status = ORDER if params[:status] == 1
    redirect_to :action => "show"
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :user_id, :status, :image)
  end
end
