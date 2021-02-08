class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
  end

  def confirm
    binding.pry
  end
end
