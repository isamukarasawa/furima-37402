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
      it 'biru_nameが空でも購入できる' do
        @order.biru_name = ''
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
        @order.post_code = '０００-００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeがが半角ハイフンを含む形でなければ購入できないこと' do
        @order.post_code = '000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'telに半角数字以外が含まれている場合は購入できない' do
        @order.tel = '０0000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが9桁以下では購入できないこと' do
        @order.tel = '000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
      it 'prefecture_idが1では登録できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end  
      it 'tokenが空の場合は購入できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end