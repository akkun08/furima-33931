require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nameとemail,passwordとpassword_confirmationとjapanese_last_nameとjapanese_first_nameとkana_last_nameとkana_first_nameとyear_month_dayがあるとき' do
        expect(@user).to be_valid
      end
      it 'nameが6文字以内であれば登録できる' do
        @user.name = "aaaaaa"
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
      it 'nameが空では登録できない。' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationがからでは登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない ' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user
      end
      it 'passwordが5文字以下は登録できない' do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'japanese_last_nameが空では登録できない' do
        @user.japanese_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese last name can't be blank")
      end
      it 'japanese_first_nameが空では登録できない' do
        @user.japanese_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Japanese first name can't be blank")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'year_month_dayが空では登録できない' do
        @user.year_month_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Year month day can't be blank")
      end
    end
  end
end  