class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.string :name, null: false
      t.integer :age, null: false

      t.timestamps null: false

    end
  end
end
