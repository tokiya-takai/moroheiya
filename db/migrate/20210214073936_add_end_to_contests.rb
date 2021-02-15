class AddEndToContests < ActiveRecord::Migration[6.0]
  def change
    add_column :contests, :end, :boolean, default: false
  end
end
