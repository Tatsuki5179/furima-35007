require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do

    context '商品情報入力がうまくいく時' do
      it 'product_name、image、product_description、category、product_condition、shipping_charge、
      shipping_area、product_priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
   end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'product_descriptionが空だと出品できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'product_conditionが空だと出品できない' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition Select")
      end

      it 'categoryが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'shipping_chargeが空だと出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end

      it 'shipping_areaが空だと出品できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
      end

      it 'days_shipが空だと出品できない' do
        @item.days_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship Select")
      end

      it 'categoryが未選択だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'product_conditionが未選択だと出品できない' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition Select")
      end

      it 'shipping_chargeが未選択だと出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end

      it 'shipping_areaが未選択だと出品できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
      end

      it 'days_shipが未選択だと出品できない' do
        @item.days_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship Select")
      end

      it 'product_priceが空だと出品できない' do
        @item.product_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price is not a number")
      end

      it "product_priceが299以下だと登録できないこと" do
        @item.product_price =  299
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be greater than or equal to 300")
      end

      it "product_priceが10000000だと登録できないこと" do
        @item.product_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be less than or equal to 9999999")
      end

      it 'product_priceが全角数字だと出品できない' do
        @item.product_price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price is not a number")
      end

      it 'categoryで1が選択された場合だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
        end

      it 'product_conditionで1が選択された場合だと出品できない' do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition Select")
          end

      it 'shipping_chargeで1が選択された場合だと出品できない' do
         @item.shipping_charge_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Shipping charge Select")
       end
      
       it 'shipping_areaで1が選択された場合だと出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
       end

       it 'days_shipで1が選択された場合だと出品できない' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship Select")
       end
    end
  end
end


