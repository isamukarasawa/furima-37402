class ItemsController < ApplicationController
  before_action :set_items, only: [:new]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def items_params
    params.require(:item).permit(:image, :product_name, :expianation, :category_id, :product_situation_id, :delivery_charge_id, :prefecturse_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_items
    authenticate_user!
  end

end