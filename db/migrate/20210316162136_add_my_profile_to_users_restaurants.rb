class AddMyProfileToUsersRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :users_restaurants, :my_profile, :boolean
  end
end
