class Restaurant < ApplicationRecord
    has_many :users_restaurants
    has_many :users, through: :users_restaurants
    has_many :comments 
end
