class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string      :title,       null: false
      t.integer     :genre_id,    null: false
      t.integer     :category_id, null: false
      t.text        :content,     null: false
      t.datetime    :deadline,    null: false
      t.boolean     :public,      null: false, default: false
      t.references  :user,        foreign_key: true
      t.timestamps
    end
  end
end
