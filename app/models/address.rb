class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }  #ジャンルの選択が「--」の時は保存できないようにする
    validates :city, :house_number
    validates :phone_number, format: {with: /\[0-9]{11}/} 
  end
end
