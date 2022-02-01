require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

describe '商品の出費' do
    context '商品の出品ができる時'do
      it '必須項目が存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end

  context  "商品の出品ができない時"do                    
    it "product_nameがない場合は登録できないこと" do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "expianationがない場合は登録できないこと" do
      @item.expianation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Expianation can't be blank")
    end

    it "category_idは1では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "product_situation_idが1では登録できないこと" do
      @item.product_situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product situation can't be blank")
    end

    it "delivery_charge_idが1では登録できないこと" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it "prefecturse_idが1では登録できないこと" do
      @item.prefecturse_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecturse can't be blank")
    end

    it "delivery_day_idが1では登録できないこと" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが299以下だと登録できないこと" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it "priceが10000000だと登録できないこと" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
  end
end
end