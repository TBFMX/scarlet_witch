class CreateProcedureMaterials < ActiveRecord::Migration
  def change
    create_table :procedure_materials do |t|
      t.integer :procidure_id
      t.integer :material_id

      t.timestamps
    end
  end
end
