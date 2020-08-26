class OrdersController < ApplicationController
  before_action :move_to_new, only: [:index, :create, :new]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(params_order)
    binding.pry
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path 
    end
  end

  def params_order
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge( user_id: current_user.id)
  end
end
