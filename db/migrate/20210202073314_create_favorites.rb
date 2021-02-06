class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references      :user,  foreign_key: true
      t.references      :work,  foreign_key: true
      t.boolean         :black_favorite,  default: false
      t.boolean         :gold_favorite,   default: false
      t.boolean         :purple_favorite, default: false
      t.boolean         :normal_favorite, default: false
      t.timestamps
    end
  end
end
