class AddWorksCountToContests < ActiveRecord::Migration[6.0]
  def self.up
    add_column :contests, :works_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :contests, :works_count
  end
end
