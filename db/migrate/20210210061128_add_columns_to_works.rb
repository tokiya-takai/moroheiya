class AddColumnsToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :purples_count, :integer
    add_column :works, :golds_count, :integer
    add_column :works, :blacks_count, :integer
  end
end
