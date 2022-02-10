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
      it '郵便番号が空の場合は購入できないこと' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号が半角英数字3桁と4桁でない場合は購入できないこと' do
        @order.post_code = '０００-００００'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できないこと' do
        @order.post_code = '000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '都道府県が空の場合は購入できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('都道府県を入力してください')
      end
      it '都道府県が1では登録できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '市区町村が空の場合は購入できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('市区町村を入力してください')
      end
      it '住所が空の場合は購入できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('住所を入力してください')
      end
      it '電話番号が空の場合は購入できないこと' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order.tel = '０0000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が9桁以下では購入できないこと' do
        @order.tel = '000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'アイテムが紐付いていないと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('アイテムを入力してください')
      end
      it 'トークンが空の場合は購入できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('トークンを入力してください')
      end
    end
  end
end
