require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it 'image,item_name,explanation,category_id,condition_id,delivery_fee_id,delivery_source_id,days_to_ship_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字なら出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end

      it 'priceが300なら出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end

      it 'priceが9999999なら出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it 'delivery_fee_idがからでは出品できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end

      it 'delivery_sourceが空では出品できない' do
        @item.delivery_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source is not a number")
      end

      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it 'priceが10000000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'priceが全角漢字では出品できない' do
        @item.price = '千円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが全角ひらがなでは出品できない' do
        @item.price = 'せんえん'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
       
      it 'priceが全角カタカナでは出品できない' do
        @item.price = 'センエン'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英字では出品できない' do
        @item.price = 'senyen'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
