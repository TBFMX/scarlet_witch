class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :nombre
      t.string :instrucciones

      t.timestamps
    end
  end
end
