class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :renter_id, null: false
      t.integer :car_id, index:true
      t.integer :duration_hours
      t.integer :miles_driven

      t.timestamps null: false
    end
  end
end
