class AddWeightToProcedureRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :procedure_records, :weight, :float
    add_index :procedure_records, :procedure_on
  end
end
