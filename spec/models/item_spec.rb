require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品出品が保存できる場合' do
      it 'すべて入力されると保存できる ' do
        expect(@item).to be_valid
      end
      it 'priceが¥300以上の時、保存できる。 ' do
        @item.price = 4444
        expect(@item).to be_valid
      end
      it ' priceが¥9999999の時、保存できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品が保存できない場合' do
        it ' imageが空だと保存できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank") 
        end
        it 'item_nameが空だと保存できない ' do
          @item.item_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it ' item_detailが空だと保存できない' do
          @item.item_detail = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item detail can't be blank")
        end
        # it ' categoryの数字が1は保存できない' do
        #   @item.category_id = 1
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Category must be greater than or equal to 2", "Category must be other than 1")
        # end
        # it ' categoryの数字が12以上は保存できない' do
        #   @item.category_id = 12
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Category must be less than or equal to 11")
        # end
        # it 'shipping_charge_idの数字が1は保存できない ' do
        #   @item.shipping_charge_id = 1
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Shipping charge must be greater than or equal to 2", "Shipping charge must be other than 1")
        # end
        # it 'shipping_charge_idの数字が4以上は保存できない ' do
        #   @item.shipping_charge_id = 4
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Shipping charge must be less than or equal to 3")
        # end
        # it 'prefecture_idの数字が1は保存できない ' do
        #   @item.prefecture_id = 1
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Prefecture must be greater than or equal to 2", "Prefecture must be other than 1")
        # end
        # it 'prefecture_idの数字が49以上は保存できない ' do
        #   @item.prefecture_id = 49
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Prefecture must be less than or equal to 48")
        # end
        # it 'state_idの数字が1は保存できない ' do
        #   @item.state_id = 1
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("State must be greater than or equal to 2", "State must be other than 1")
        # end
        # it 'state_idの数字が8以上は保存できない ' do
        #   @item.state_id = 8
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("State must be less than or equal to 7")
        # end
        # it 'delivery_idの数字が1は保存できない ' do
        #   @item.delivery_id = 1
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Delivery must be greater than or equal to 2", "Delivery must be other than 1")
        # end
        # it 'delivery_idの数字が5は保存できない ' do
        #   @item.delivery_id = 5
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Delivery must be less than or equal to 4")
        # end
        
        it 'priceが299以下は保存できない ' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceが10000000以上は保存できない ' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが空では保存できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
        end
        it 'priceが英数混合では保存できないこと' do
          @item.price = "111aaaaaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが半角英語だけでは保存できないこと' do
          @item.price = "aaaaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが全角文字では保存できないこと' do
          @item.price = "ＡＡＡＡＡ"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
    end
  end
end
  
