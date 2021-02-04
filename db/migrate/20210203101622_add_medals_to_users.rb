class AddMedalsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :count_second, :integer, default: 0
    add_column :users, :count_third, :integer, default: 0
  end
end
