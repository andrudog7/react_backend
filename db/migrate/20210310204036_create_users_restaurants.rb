class CreateUsersRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :users_restaurants do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :top_four
      t.boolean :outdoor_seating
      t.boolean :reservations
      t.boolean :bottomless
      t.string :bottomless_price
      t.string :time_limit
      t.string :attribute1
      t.string :attribute2
      t.string :attribute3

      t.timestamps
    end
  end
end
