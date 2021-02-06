class CreateNormals < ActiveRecord::Migration[6.0]
  def change
    create_table :normals do |t|
      t.integer     :user_id
      t.integer     :work_id
      t.timestamps
    end
  end
end
