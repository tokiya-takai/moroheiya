class CreateOtherUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :other_users do |t|
      t.references      :user,    null:false, unique: true
      t.text            :profile
      t.integer         :black_favorite,    default: 0
      t.integer         :gold_favorite,     default: 0
      t.integer         :purple_favorite,   default: 0
      t.integer         :count_first,       default: 0
      t.integer         :count_second,      default: 0
      t.integer         :count_third,       default: 0
      t.timestamps
    end
  end
end
