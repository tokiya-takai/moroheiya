class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    if (@order.black == nil) && (@order.gold == nil) && (@order.purple == nil)
      @order.errors[:base] << "1つ以上選択してください。"
      render :new
    end
  end


  private
  def order_params
    params.require(:order).permit(:black,:gold,:purple).merge(user_id: current_user.id)
  end
end
