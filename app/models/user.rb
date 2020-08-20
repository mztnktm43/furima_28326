class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze # 半角英数混合
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze # 全角ひらがなカタカナ漢字
  NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze # 全角カタカナ

  validates :nickname, :birthday, presence: true
  validates :password, presence: true, format: { with: /\d{6}/, with: PASSWORD_REGEX } # ６文字以上
  validates :family_name, :first_name, presence: true, format: { with: NAME_REGEX }
  validates :family_name_reading, :first_name_reading, presence: true, format: { with: NAME_READING_REGEX }
end
