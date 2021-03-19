class AddDragBrunchToUsersRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :users_restaurants, :drag_brunch, :boolean
  end
end
