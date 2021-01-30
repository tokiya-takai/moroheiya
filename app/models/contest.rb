class Contest < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :genre_id
    validates :category_id
    validates :content
    validates :deadline
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :category_id
  end
end
