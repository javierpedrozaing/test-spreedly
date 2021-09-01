class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :token
      t.integer :amount
      t.string :quantity
      t.references :flight

      t.timestamps
    end
    add_index :transactions, :flight_id
  end
end
