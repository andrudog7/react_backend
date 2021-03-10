class User < ApplicationRecord
    #has_secure_password
    has_one_attached :avatar
    validates :email, :username, presence: :true
    validates :email, :username, uniqueness: :true
    has_many :users_restaurants
    has_many :restaurants, through: :users_restaurants
    has_many :comments 

    def my_image 
        if avatar.attached?
          avatar
        else
          image
        end
    end

    def my_restaurants
        self.users_restaurants
    end
end
