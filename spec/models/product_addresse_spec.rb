require 'rails_helper'

RSpec.describe ProductAddresse, type: :model do
  describe '購入情報の保存' do
    before do
      user =  FactoryBot.create(:user)
      item =  FactoryBot.create(:item)
      sleep 0.1
      @product_addresse = FactoryBot.build(:product_addresse, user_id: user.id, item_id: item.id)
  end

    context '内容に問題ない場合' do
      it 'postal_code、 city、house_number、 shipping_area_id、 building_nameがすべての値が正しく入力されていれば保存できること' do
        expect(@product_addresse).to be_valid
      end

      it 'building_nameは空でも保存できる' do
        @product_addresse.building_name = nil
        expect(@product_addresse).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @product_addresse.postal_code = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @product_addresse.postal_code = '1234567'
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include('Postal code is invalid')
      end
      
      it 'cityは空だと保存できない' do
        @product_addresse.city = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberは空だと保存できない' do
        @product_addresse.house_number = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("House number can't be blank")
      end

      it 'shipping_areaが空だと保存できない' do
        @product_addresse.shipping_area_id = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Shipping area Select")
      end

      it 'shipping_areaで1が選択された場合だと出品できない' do
         @product_addresse.shipping_area_id = 1
         @product_addresse.valid?
         expect(@product_addresse.errors.full_messages).to include("Shipping area Select")
       end

       it 'phone_numberが空だと保存できない' do
        @product_addresse.phone_number = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Phone number is not a number")
      end


       it 'postal_codeが未選択だと保存できない' do
        @product_addresse.postal_code = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが未選択だと保存できない' do
        @product_addresse.city = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが未選択だと保存できない' do
        @product_addresse.house_number = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが未選択だと保存できない' do
        @product_addresse.phone_number = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Phone number is not a number")
      end

      it 'shipping_areaが未選択だと保存できない' do
        @product_addresse.shipping_area_id = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Shipping area Select")
      end

      it "tokenが空では登録できないこと" do
        @product_addresse.token = nil
        @product_addresse.valid?
        expect(@product_addresse.errors.full_messages).to include("Token can't be blank")
      end
     end
    end
  end
  

