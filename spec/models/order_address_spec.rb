require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '商品の購入ができる時' do
      it '必須項目が存在していれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'post_codeが空の場合は購入できないこと' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空の場合は購入できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合は購入できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合は購入できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空の場合は購入できないこと' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end
      it 'post_codeが半角英数字3桁と4桁でない場合は購入できないこと' do
        @order.post_code = '０００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'telが半角英数字で11桁でない場合は購入できないこと' do
        @order.tel = '０００００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end