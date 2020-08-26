class OrdersController < ApplicationController
  before_action :move_to_new, only: [:index, :create, :new]
  before_action :item_set, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path 
    end
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id,).merge( user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.cost,
      card: params[:token],
      currency:'jpy'
    )
  end
end
