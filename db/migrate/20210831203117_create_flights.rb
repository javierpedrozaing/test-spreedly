class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :destination
      t.string :origin
      t.integer :price

      t.timestamps
    end
  end
end
