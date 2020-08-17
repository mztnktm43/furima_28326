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
        @user.password = "000000"
        @user.password_cpnfirmation = "000000"
        expect(@user).to be_valid
      end
      it "family_name,firstnameが全角のひらがなカタカナ漢字であれば登録できる" do
      end
      it "family_name_reading,first_name_readingが全角カタカナであれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "passwaordが空だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "family_name_readingが空だと登録できない" do
      end
      it "first_name_readingが空だと登録できない" do
      end
      it "passwordが６文字未満だと登録できない" do
      end
      it "passwordが英語だけだと登録できない" do
      end
      it "passwordが数字だけだと登録できない" do
      end
      it "emailが重複していると登録できない" do
      end
      it "family_nameが英語だと登録できない" do
      end
      it "first_nameが英語だと登録できない" do
      end
      it "family_name_readingが英語だと登録できない" do
      end
      it "first_name_readingが英語だと登録できない" do
      end
      it "family_nameが数字だと登録できない" do
      end
      it "first_nameが数字だと登録できない" do
      end
      it "family_name_readingが数字だと登録できない" do
      end
      it "first_name_readingが数字だと登録できない" do
      end
      it "family_name_readingがひらがなだと登録できない" do
      end
      it "first_name_readingがひらがなだと登録できない" do
      end
      it "family_name_readingが漢字だと登録できない" do
      end
      it "first_name_readingが漢字だと登録できない" do
      end
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb