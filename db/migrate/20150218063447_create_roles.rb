class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.string :reference_code
      t.boolean :status
      t.integer :created_by
      t.integer :modified_by

      t.timestamps null: false
    end
  end
end
