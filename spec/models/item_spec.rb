require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる時' do
      it '必須項目が存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '商品名が空の場合は登録できないこと' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品説明が空の場合は登録できないこと' do
        @item.expianation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end

      it 'カテゴリーは1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end

      it 'カテゴリーが空の場合は登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end

      it '商品の状態が1では登録できないこと' do
        @item.product_situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end

      it '商品の状態が空の場合は登録できないこと' do
        @item.product_situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end

      it '配送条件が1では登録できないこと' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送条件は1以外の値にしてください')
      end

      it '配送条件が空の場合は登録できないこと' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送条件を入力してください')
      end

      it '都道府県が1では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end

      it '都道府県が空の場合は登録できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県を入力してください')
      end

      it '配送日が1では登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送日は1以外の値にしてください')
      end

      it '配送日が空の場合は登録できないこと' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送日を入力してください')
      end

      it '値段がない場合は登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('値段を入力してください')
      end

      it '値段が299以下だと登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は299より大きい値にしてください')
      end

      it '値段が10000000だと登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は10000000より小さい値にしてください')
      end

      it '値段が半角英数字でなければ登録できないこと' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は数値で入力してください')
      end

      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end

      it '画像が空の場合は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
    end
  end
end
