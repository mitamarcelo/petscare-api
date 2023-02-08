class CreateProcedureRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :procedure_records do |t|
      t.string :category, null: false, default: 'appointment'
      t.string :title, null: false
      t.text :description
      t.date :procedure_on, null: false
      t.datetime :next_procedure_date
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
    add_index :procedure_records, :next_procedure_date
    add_index :procedure_records, :category
  end
end
