class Work < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  counter_culture :contest, column_name: 'works_count'

  has_one_attached :image
  has_one_attached :video

  with_options presence: true do
    validates :title,   length: {maximum: 40}
    validates :content, length: {maximum: 1000}
    validates :image
  end

  # validates :video, format: {with: }

end
