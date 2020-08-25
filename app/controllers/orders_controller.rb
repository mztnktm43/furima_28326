class OrdersController < ApplicationController
  before_action :move_to_new, only: [:index, :create, :new]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  def new
  end

  private

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path 
    end
  end
end
