class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  validates :image, :category_id, :product_status_id, :fee_id, :prefecture_id, :delivery_day_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :comment, presence: true, length: { maximum: 1000 }
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } # 3-7桁しか入力できない

  # ActiveHashが「--」のときに保存できない
  with_options numericality: { other_than: 1 } do
    validates :category_id, :product_status_id, :fee_id, :prefecture_id, :delivery_day_id
  end
end
