require "rails_helper"

RSpec.describe PurchasePurchaseAddress, type: :model do
  describe '商品購入の値の保存' do
    before do
      user = FactoryBot.create(:user)
      @ppa = FactoryBot.build(:purchase_purchase_address, user_id: user.id)
    end

    context '商品が購入できる時' do
      
      it 'すべての値が入力できると保存できる' do
        expect(@ppa).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @ppa.building_name = "" 
        expect(@ppa).to be_valid
      end
        
      it 'phone_numberは11桁でほぞんできること' do
        @ppa.phone_number = nil 
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Phone number is invalid")
      end
    end
          
    context '商品が購入できないとき' do
            
      it 'postal_codeが空だと保存できないこと' do
        @ppa.postal_code = ""
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @ppa.postal_code = "1234567"
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @ppa.prefecture_id  = 0
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Prefecture can't be blank" )
      end
      it 'municipalityは空でも保存できないこと' do
        @ppa.municipality  = ""
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @ppa.address = "" 
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberは空では登録できないこと' do
        @ppa.phone_number = nil 
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @ppa.phone_number = 111111111111
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数字混合では存在できない' do
        @ppa.phone_number ="123232eqwe"
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @ppa.token = nil
        @ppa.valid?
        expect(@ppa.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
