class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :orders

  with_options presences: true do
    validates :nickname 
    validates :email, format: {with: /@+/ }#一意性(カラム内での重複禁止)、＠を含む
    validates :encrypted_password, format: { with: /\d{6}/, PASSWORD_REGEX }#６文字以上、半角英数混合
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }#全角ひらがなカタカナ漢字
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }# 〃
    validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }#全角カタカナ
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }# 〃
    validates :birthday
  end
end