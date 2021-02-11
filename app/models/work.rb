class Work < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :normals, dependent: :destroy
  has_many :working_users, through: :works, source: :user

  has_many :purples, dependent: :destroy
  has_many :working_users, through: :works, source: :user

  has_many :golds, dependent: :destroy
  has_many :working_users, through: :works, source: :user

  has_many :blacks, dependent: :destroy
  has_many :working_users, through: :works, source: :user

  counter_culture :contest, column_name: 'works_count'

  has_one_attached :image, dependent: :destroy
  has_one_attached :video, dependent: :destroy

  with_options presence: true do
    validates :title,   length: {maximum: 40}
    validates :content, length: {maximum: 1000}
    validates :image
    validates :user_id
  end

end
