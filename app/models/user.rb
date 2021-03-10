class User < ApplicationRecord
    #has_secure_password
    validates :email, :username, presence: :true
    validates :email, :username, uniqueness: :true
    has_many :users_restaurants
    has_many :restaurants, through: :users_restaurants
    has_many :comments 
end
