class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :renter_id, null: false
      t.integer :car_id, null: false
      t.integer :duration
      t.integer :miles

      t.timestamps null: false
    end
  end
end
