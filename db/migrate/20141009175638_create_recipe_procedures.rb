class CreateRecipeProcedures < ActiveRecord::Migration
  def change
    create_table :recipe_procedures do |t|
      t.integer :recipe_id
      t.integer :procedure_id

      t.timestamps
    end
  end
end
