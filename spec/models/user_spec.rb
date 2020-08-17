require 'rails_helper'
#RSpec.describe User, type: :model do
describe User do
  before do
    @user = FactoryBot.build(:user) 
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,birthday,family_name,first_name,family_name_reading,first_name_readingが存在していると登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上であれば登録できる" do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "passwaordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_readingが空だと登録できない" do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it "first_name_readingが空だと登録できない" do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "passwordが６文字未満だと登録できない" do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英語だけだと登録できない" do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "family_nameが英語だと登録できない" do
        @user.family_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが英語だと登録できない" do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_readingが英語だと登録できない" do
        @user.family_name_reading = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "first_name_readingが英語だと登録できない" do
        @user.first_name_reading = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "family_nameが数字だと登録できない" do
        @user.family_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが数字だと登録できない" do
        @user.first_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_readingが数字だと登録できない" do
        @user.family_name_reading = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "first_name_readingが数字だと登録できない" do
        @user.first_name_reading = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "family_name_readingがひらがなだと登録できない" do
        @user.family_name_reading = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "first_name_readingがひらがなだと登録できない" do
        @user.first_name_reading = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "family_name_readingが漢字だと登録できない" do
        @user.family_name_reading = '仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end
      it "first_name_readingが漢字だと登録できない" do
        @user.first_name_reading = '仮名'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb
# expect(@user.errors.full_message).to include("***** can't be blank")