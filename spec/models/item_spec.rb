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
        @item.name = 'abc'
        @item.comment = 'abc'
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.comment = 'abc'
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'commentが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_status_idが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.product_status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it 'fee_idが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.fee_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'prefecture_idが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delibery_day_idが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.delivery_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'costが空だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.cost = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'nameが40文字以上だと出品できない' do
        @item.name
        @item.comment = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'commentが1000字以上だと出品できない' do
        @item.name = 'abc'
        @item.comment
        @item.valid?
        expect(@item.errors.full_messages).to include('Comment is too long (maximum is 1000 characters)')
      end
      it 'costが¥0~299-だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be greater than or equal to 300')
      end
      it 'costが¥9,999,999以上だと出品できない' do
        @item.name = 'abc'
        @item.comment = 'abc'
        @item.cost = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be less than or equal to 9999999')
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
# @item.valid?
# @item.errors
# @item.errors.full_messages
