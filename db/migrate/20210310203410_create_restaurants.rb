class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :price
      t.string :address1
      t.string :state
      t.string :zip_code
      t.integer :rating
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
