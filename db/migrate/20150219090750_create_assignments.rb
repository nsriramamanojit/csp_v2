class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|

      t.integer :user_id
      t.integer :role_id

      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
