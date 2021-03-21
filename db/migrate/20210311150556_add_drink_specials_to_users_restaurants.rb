class AddDrinkSpecialsToUsersRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :users_restaurants, :drink_specials, :boolean
  end
end
