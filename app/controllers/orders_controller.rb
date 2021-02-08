class OrdersController < ApplicationController
  before_action :get_order, only: [:create, :confirm]

  def new
    @order = Order.new
  end

  def create
    if @order.save
      add_user_favorite
      render :complete and return
    else
      @order.errors[:base] << "予期しないエラーが発生しました。"
      render :new and return
    end
  end

  def confirm
    if (@order.black == nil) && (@order.gold == nil) && (@order.purple == nil)
      @order.errors[:base] << "1つ以上選択してください。"
      render :new and return
    end
  end

  def complete
    unless @order.errors == nil
      render :new and return
    end
  end


  private
  def get_order
    @order = Order.new(order_params)
  end

  def order_params
    params.require(:order).permit(:black,:gold,:purple).merge(user_id: current_user.id)
  end

  def add_user_favorite
    orders = params.require(:order)
    favorites = []
    orders.each_value do | order |
      order = "0" if order == ""
      favorites.push(order)
    end
    user = User.find(@order.user_id)
    user.black_favorite += favorites[0].to_i
    user.gold_favorite += favorites[1].to_i
    user.purple_favorite += favorites[2].to_i
    begin
      user.save
    rescue
      @order.errors[:base] << "予期せぬエラーが発生しました。"
    end
  end
end
