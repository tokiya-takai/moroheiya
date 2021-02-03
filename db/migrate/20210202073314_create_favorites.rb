class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references      :user,  foreign_key: true
      t.references      :work,  foreign_key: true
      t.integer         :black_favorite,  default: 0
      t.integer         :gold_favorite,   default: 0
      t.integer         :purple_favorite, default: 0
      t.integer         :normal_favorite, default: 0
      t.timestamps
    end
  end
end
