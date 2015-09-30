class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.decimal :rate, null: false
      t.integer :garage_id, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.integer :mileage, null: false
      t.integer :year, null: false
      t.string :plate, null: false
    end
  end
end
