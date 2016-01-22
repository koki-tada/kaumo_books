class BorrowsController < ApplicationController
  def index
    @borrow = Book.where.not(:user_id => 1).all
  end

  def show
    @borrow_id = Book.find(params[:id])
    @all_user = User.all
  end


end