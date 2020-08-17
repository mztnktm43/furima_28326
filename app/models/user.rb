class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :birthday, presence: true
  validates :password, presence: true, format: { with: /\d{6}/, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } # ６文字以上、半角英数混合
  validates :family_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } # 全角ひらがなカタカナ漢字
  validates :family_name_reading, :first_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ
end
