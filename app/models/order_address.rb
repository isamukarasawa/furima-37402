class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:biru_name,:tel,:item_id,:user_id, :token

  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, presence: true
    validates :city, presence: true
    validates :address, presence: true
    validates :biru_name
    validates :tel, presence: true, format: {with: /\A[0-9]{11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, biru_name: biru_name, tel: tel, order_id: order.id)
  end
end