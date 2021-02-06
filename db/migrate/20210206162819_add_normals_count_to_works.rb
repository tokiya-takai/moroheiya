class AddNormalsCountToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :normals_count, :integer
  end
end
