class Gold < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: :golds_count

  validates :work_id, uniqueness: { scope: :user_id }
end
