class UsersController < ApplicationController
  def index
    @user = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @user_books = Book.where(:user_id => params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = '保存しました。'
      redirect_to @user
    else
      flash.alert = '保存に失敗しました。もう一度確認してください。'
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = user_params['name']
    if @user.save
      flash.notice = '保存しました。'
      render action: 'show'
    else
      flash.alert = '保存に失敗しました。もう一度確認してください。'
      redirect_to :back
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
