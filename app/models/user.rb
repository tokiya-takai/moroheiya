class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  
  has_one :credit_card, dependent: :destroy
  has_many :contests, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :order

  has_many :normals, dependent: :destroy
  has_many :normal_works, through: :normals, source: :work

  has_many :purples, dependent: :destroy
  has_many :purple_works, through: :purples, source: :work

  has_many :golds, dependent: :destroy
  has_many :gold_works, through: :golds, source: :work

  has_many :blacks, dependent: :destroy
  has_many :black_works, through: :blacks, source: :work

  has_one_attached :image, dependent: :destroy




  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  JAPANESE_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: PASSWORD_REGEX }, allow_blank: true

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }

    validates :family_name,       format: {with: JAPANESE_REGEX }, length: { maximum: 20 }, allow_blank: true
    validates :family_name
    validates :first_name,        format: {with: JAPANESE_REGEX }, length: { maximum: 20 }, allow_blank: true
    validates :first_name

    validates :family_name_kana,  format: {with: KATAKANA_REGEX }, length: { maximum: 20 }, allow_blank: true
    validates :family_name_kana
    validates :first_name_kana,   format: {with: KATAKANA_REGEX }, length: { maximum: 20 }, allow_blank: true
    validates :first_name_kana
    
    validates :birthday
  end
  
  def update_without_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
