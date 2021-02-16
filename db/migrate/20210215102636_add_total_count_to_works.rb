class AddTotalCountToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :total_count, :integer, default: 0
  end
end
