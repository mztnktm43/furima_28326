require 'rails_helper'

describe OrderAddress do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test.jpeg')
    @item.save
    @order = FactoryBot.create(:order, item_id: @item.id)
    @order_address = FactoryBot.build(:order_address, order_id: @order.id)
  end

  describe '購入する(購入済みの登録がされる)' do
    context '購入がうまく登録されるとき' do
      it 'postal_codeとprefecture_idとcityとhouse_numberとphone_numberとorder_idとtokenが存在するとき' do
        expect(@order_address).to be_valid
      end
    end
    context '住所がうまく登録できないとき' do
      it 'postal_codeが空のとき' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeのハイフンがないとき' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idが空のとき' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'prefecture_idがid:1{--}のとき' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityが空のとき' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空のとき' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空のとき' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが12桁以上のとき' do
        @order_address.phone_number = '123456123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空のとき' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tokenを入力してください")

      end
    end
  end
end
