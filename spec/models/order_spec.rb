require 'rails_helper'

# RSpec.describe Order, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Order do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入' do
    context '購入ができないとき' do
      it 'userが紐づいていないとき' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐づいていないとき' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end
    end
  end
end