require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
    
    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it "全ての項目が正しく入力されていれば登録できる" do
          expect(@item).to be_valid
        end
      end
      
      context '商品出品がうまくいかないとき' do
        it "画像が選択されていなければ出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "商品名が空では出品できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        
        it "商品説明が空では出品できない" do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
         
        it "カテゴリーが選択されていなければ出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        
        it "商品の状態が選択されていなければ出品できない" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end

        it "配送料の負担が選択されていなければ出品できない" do
          @item.postage_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage must be other than 1")
        end

        it "発送元の地域が選択されていなければ出品できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "発送までの日数が選択されていなければ出品できない" do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
        end

        it "販売価格が空では出品できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        
        it "販売価格は全角で入力されていると出品できない" do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "販売価格は半角英数混合で入力されていると出品できない" do
          @item.price = "a1000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "販売価格は￥１０００００００以上で入力されていると出品できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "販売価格は￥２９９以下で入力されていると出品できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      end
    end
end