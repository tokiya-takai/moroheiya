class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order, only: [:create, :confirm]

  require 'payjp'

  def new
    @order = Order.new
  end

  def create
    if @order.save
      add_user_favorite
      pay = calc_pay
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        :amount => pay,
        :customer => card.customer_id,
        :currency => 'jpy',
      )
      render :complete and return
    else
      @order.errors[:base] << "予期しないエラーが発生しました。"
      render :new and return
    end
  end

  def confirm
    if (@order.black == nil || @order.black == 0 ) && (@order.gold == nil || @order.gold == 0 ) && (@order.purple == nil || @order.purple == 0 )
      @order.errors[:base] << "1つ以上選択してください。"
      render :new and return
    end
    @order.black = 0 if @order.black == nil
    @order.gold = 0 if @order.gold == nil
    @order.purple = 0 if @order.purple == nil
    
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
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
    favorites = get_favorites
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

  def calc_pay
    favorites = get_favorites
    pay = favorites[0].to_i * 500
    pay += favorites[1].to_i * 200
    pay += favorites[2].to_i * 100
    return pay
  end

  def get_favorites
    orders = params.require(:order)
    favorites = []
    orders.each_value do | order |
      order = "0" if order == ""
      favorites.push(order)
    end
    return favorites
  end
end
