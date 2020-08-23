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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字以上だと出品できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'commentが空だと出品できない' do
        @item.comment = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'commentが1000字以上だと出品できない' do
        @item.comment = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Comment is too long (maximum is 1000 characters)')
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_id{id:1,name:--}だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'product_status_idが空だと出品できない' do
        @item.product_status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it 'product_status_id{id:1,name:--}だと出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product status must be other than 1')
      end
      it 'fee_idが空だと出品できない' do
        @item.fee_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'fee_id{id:1,name:--}だと出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_id{id:1,name:--}だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'delibery_day_idが空だと出品できない' do
        @item.delivery_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'delivery_day_id{id:1,name:--}だと出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it 'costが空だと出品できない' do
        @item.cost = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'costが¥0~299-だと出品できない' do
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be greater than or equal to 300')
      end
      it 'costが¥9,999,999以上だと出品できない' do
        @item.cost = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be less than or equal to 9999999')
      end
    end
  end
end
