class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('id DESC')
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

  def show
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  
    
  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :product_name, :expianation, :category_id, :product_situation_id, :delivery_charge_id,
                                 :prefecturse_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
