require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "全ての項目が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも保存できる' do
        @order_address.address_line_2 = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it '郵便番号はハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = "1234567" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が選択されていないと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it '市区町村が空では保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      it '番地は空では保存できない' do
        @order_address.address_line_1 = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line 1 can't be blank")
      end
      
      it '電話番号が空だと保存できないこと' do
        @order_address.tel = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      
      it '電話番号はハイフンが入っていると保存できない' do
        @order_address.tel = "090-1234-5678" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it '電話番号は11文字以内でないと保存できない' do
        @order_address.tel = "090123456789" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      
      it '電話番号は英数混合では保存できない' do
        @order_address.tel = "aaa123456789" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      
      it "user_idが空では登録できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      
      it "item_idが空では登録できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end