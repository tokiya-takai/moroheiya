class Purple < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: :purples_count

  validates :work_id, uniqueness: { scope: :user_id }
end
