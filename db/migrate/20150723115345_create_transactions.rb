class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :csp_code
      t.integer :amount
      t.date :transaction_date


      t.integer :created_by
      t.integer :modified_by

      t.timestamps null: false
    end
  end
end
