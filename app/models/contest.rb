class Contest < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :category

  with_options presence: true do
    validates :title,       length: { maximum: 40 }
    validates :content,     length: { maximum: 1000 }
    validates :deadline
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :category_id
  end

  # 締切は現在時刻以降は保存できない
  validate :deadline_start

  def deadline_start
    return if deadline.blank?
    today = DateTime.now
    if deadline < today
      errors[:base] << "締め切りは現在時刻以降のものを選択してください"
    end
  end

end
