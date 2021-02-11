class Black < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: :blacks_count

  validates :work_id, uniqueness: { scope: :user_id }
end
