class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :contests

  JAPANESE_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
    validates :nickname
    validates :family_name,       format: {with: JAPANESE_REGEX }, allow_blank: true
    validates :first_name,        format: {with: JAPANESE_REGEX }, allow_blank: true
    validates :family_name_kana,  format: {with: KATAKANA_REGEX }, allow_blank: true
    validates :first_name_kana,   format: {with: KATAKANA_REGEX }, allow_blank: true
    validates :birthday
  end
end
