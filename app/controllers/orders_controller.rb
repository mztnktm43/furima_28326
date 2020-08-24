class OrdersController < ApplicationController
  def index
    @order = Oder.find(order.item_id)
  end
end
