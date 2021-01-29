class Contest < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :genre_id
    validates :category_id
    validates :content
    validates :deadline
    validates :public
  end
end
