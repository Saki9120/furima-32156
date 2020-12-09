require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての項目が正しく入力されていれば登録できる" do
          expect(@user).to be_valid
        end
      end
      
      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに＠が含まれていなければ登録できない" do
          @user.email = "test.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
  
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        
        it "passwordが6文字以上で半角英数字混合でなければ登録できない" do
          @user.password = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
        end
        
        it "passwordとpassword_confirmationが不一致では登録できない" do
          @user.password = "aaaaaa1"
          @user.password_confirmation = "bbbbbb1"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it "名字が空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        
        it "名前が空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "名字は全角（漢字・ひらがな・カタカナ）で入力されなければ登録できない" do
          @user.last_name = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it "名前は全角（漢字・ひらがな・カタカナ）で入力されなければ登録できない" do
          @user.first_name = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it "名字のフリガナが空では登録できない" do
          @user.last_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana can't be blank")
        end

        it "名前のフリガナが空では登録できない" do
          @user.first_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana can't be blank")
        end

        it "名字のフリガナは全角カタカナで入力されなければ登録できない" do
          @user.last_kana = "あああああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana is invalid")
        end
        
        it "名前のフリガナは全角カタカナで入力されなければ登録できない" do
          @user.first_kana = "あああああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana is invalid")
        end

        it "生年月日が空では登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
end
