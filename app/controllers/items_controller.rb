class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)

  private

  def item_params
    params.require(:tweet).permit(:name, :comment, :cost, :category_id, :product_status_id, :fee_id, :origin_prefecture_id, :delivery_day_id)
  end
end
