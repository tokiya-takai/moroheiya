class Work < ApplicationRecord
  belongs_to :user
  belongs_to :contest

  has_many_attached :files

  with_options presence: true do
    validates :title,   length: {maximum: 40}
    validates :content, length: {maximum: 1000}
    validates :files
  end
end
