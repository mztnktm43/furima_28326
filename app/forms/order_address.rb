class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :city, :house_number, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A[0-9]{1,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
