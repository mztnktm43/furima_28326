require 'rails_helper'

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test.jpeg')
  end

  describe '商品の出品' do
    context '商品の出品がうまくいくとき' do
      it 'image,name, comment, category_id, product_status_id, fee_id, prefecture_id, delivery_day_id, costが存在していると出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空だと出品できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'nameが40文字以上だと出品できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
      end
      it 'commentが空だと出品できない' do
        @item.comment = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'commentが1000字以上だと出品できない' do
        @item.comment = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'category_id{id:1,name:--}だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'product_status_idが空だと出品できない' do
        @item.product_status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'product_status_id{id:1,name:--}だと出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'fee_idが空だと出品できない' do
        @item.fee_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'fee_id{id:1,name:--}だと出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end
      it 'prefecture_id{id:1,name:--}だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送元の地域は1以外の値にしてください')
      end
      it 'delibery_day_idが空だと出品できない' do
        @item.delivery_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'delivery_day_id{id:1,name:--}だと出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
      it 'costが空だと出品できない' do
        @item.cost = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'costが¥0~299-だと出品できない' do
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'costが¥9,999,999以上だと出品できない' do
        @item.cost = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
