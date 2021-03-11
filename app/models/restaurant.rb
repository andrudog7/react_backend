class Restaurant < ApplicationRecord
    has_many :users_restaurants
    has_many :users, through: :users_restaurants
    has_many :comments 

    def bottomless_upvote
        self.users_restaurants.where(bottomless: true).count
    end

    def bottomless_downvote
        self.users_restaurants.where(bottomless: false).count
    end

    def reservations_upvote
        self.users_restaurants.where(reservations: true).count
    end

    def reservations_downvote
        self.users_restaurants.where(reservations: false).count
    end

    def outdoor_seating_upvote
        self.users_restaurants.where(outdoor_seating: true).count
    end

    def outdoor_seating_downvote
        self.users_restaurants.where(outdoor_seating: false).count
    end

    def drink_specials_upvote
        self.users_restaurants.where(drink_specials: true).count
    end

    def drink_specials_downvote
        self.users_restaurants.where(drink_specials: false).count
    end
end
