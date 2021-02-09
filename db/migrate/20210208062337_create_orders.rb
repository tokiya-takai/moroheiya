class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references   :user, foreign_key: true
      t.integer      :black
      t.integer      :gold
      t.integer      :purple
      t.timestamps
    end
  end
end
