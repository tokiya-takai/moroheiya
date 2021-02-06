class Normal < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: :normals_count

  validates :work_id, uniqueness: { scope: :user_id }
end
