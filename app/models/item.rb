class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :fee
  belongs_to_active_hash :origin_prefecture
  belongs_to_active_hash :delivery_day

  with_options presence: true do 
  end 

  validates :genre_id, numericality: { other_than: 1 }
  #ActiveHashが「--」のときに保存できない
end
