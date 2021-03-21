class AddDownVotesToUsersRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :users_restaurants, :drink_specials_down, :boolean
    add_column :users_restaurants, :bottomless_down, :boolean
    add_column :users_restaurants, :reservations_down, :boolean
    add_column :users_restaurants, :outdoor_seating_down, :boolean
  end
end
