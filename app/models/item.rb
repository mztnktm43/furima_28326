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

  validates :image, :name, :comment, :category_id, :product_status_id, :fee_id, :origin_prefecture_id, :delivery_day_id, presence: true

  #ActiveHashが「--」のときに保存できない
  with_options numericality: { other_than: 1 } do
    validates :category_id, :product_status_id, :fee_id, :origin_prefecture_id, :delivery_day_id
  end

end
