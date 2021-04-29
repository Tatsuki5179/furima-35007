require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '購入機能の保存' do
    before do
      user = FactoryBot.create(:user)
      @donation_addresses = FactoryBot.build(:product_addresses, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'postal_code、 city、house_number、 shipping_area_id、 building_nameがすべての値が正しく入力されていれば保存できること' do
        expect(@product_addresses).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @product_addresses.postal_code = ''
        @product_addresses.valid?
        expect(@product_addresses.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @product_addresses.postal_code = '1234567'
        @product_addresses.valid?
        expect(@product_addresses.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      
      it 'cityは空だと保存できない' do
        @product_addresses.city = ''
        expect(@product_addresses).to be_valid
      end

      it 'house_numberは空だと保存できない' do
        @product_addresses.house_number = ''
        expect(@product_addresses).to be_valid
      end

      it 'building_nameは空だと保存できない' do
        @product_addresses.building_name = ''
        expect(@product_addresses).to be_valid
      end

      it 'shipping_areaが空だと保存できない' do
        @product_addresses.shipping_area_id = nil
        @product_addresses.valid?
        expect(@product_addresses.errors.full_messages).to include("Shipping area Select")
      end

      it 'shipping_areaで1が選択された場合だと出品できない' do
         @product_addresses.shipping_area_id = 1
         @product_addresses.valid?
         expect(@product_addresses.errors.full_messages).to include("Shipping area Select")
       end

       it 'phone_numberが空だと保存できない' do
        @product_addresses.phone_number = nil
        @product_addresses.valid?
        expect(@product_addresses.errors.full_messages).to include("Phone_number Select")
      end
     end
    end
   end
  

