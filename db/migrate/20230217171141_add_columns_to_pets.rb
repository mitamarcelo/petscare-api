class AddColumnsToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :breed, :string
    add_column :pets, :species, :string, default: 'dog'
    add_column :pets, :gender, :string, default: 'male'
    add_column :pets, :dob, :date
  end
end
