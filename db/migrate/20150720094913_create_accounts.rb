class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :csp_code
      t.string :account_number
      t.string :mobile
      t.string :state
      t.string :district
      t.string :location
      t.string :bank_name
      t.string :branch_name
      t.string :ifsc
      t.string :branch_code
      t.string :address
      t.integer :balance
      t.boolean :status

      t.integer :created_by
      t.integer :modified_by

      t.timestamps null: false
    end
  end
end
