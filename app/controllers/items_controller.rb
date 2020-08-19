class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def move_to_new
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def item_params
    params.permit(:image,:name, :comment, :cost, :category_id, :product_status_id, :fee_id, :origin_prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end
