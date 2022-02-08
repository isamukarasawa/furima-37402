class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :unless_user, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


private

def order_params
  params.require(:order_address).permit(:post_code,:prefecture_id,:city,:address,:biru_name,:tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end



def set_item
  @item = Item.find(params[:item_id])
end

  def pay_item
  Payjp.api_key = "sk_test_54868a2c9262b5d55d574666"
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

  def unless_user
    if current_user.id == @item.user_id || @item.order
      redirect_to items_path
    end
  end

end
