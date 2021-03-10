class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :restaurant
      t.belongs_to :user
      t.string :text

      t.timestamps
    end
  end
end
