class Restaurant < ApplicationRecord
    has_many :users_restaurants
    has_many :users, through: :users_restaurants
    has_many :comments 

    def self.get_restaurants_from_yelp(location)
        res = YelpSearch.new(location)
        businesses = res.results["businesses"]
        businesses.each{|business| create_from_yelp_data(business)}
    end

    def self.create_from_yelp_data(business)
        if (Restaurant.find_by(yelp_id: business["id"]))
            nil
        else
        create(
            name: business["name"],
            address1: business["location"]["address1"],
            city: business["location"]["city"],
            state: business["location"]["state"],
            zip_code: business["location"]["zip_code"],
            price: business["price"],
            rating: business["rating"],
            url: business["url"],
            image_url: business["image_url"],
            yelp_id: business["id"],
            phone: business["display_phone"],
            categories: business["categories"].map{|cat|cat["title"]}
        )
    end
    end

    def formatted_categories
        self
        # .categories.map(|cat| cat.match(/(?<=title\\\"=>\\).*\\\"/).titlecase)
    end

    def bottomless_upvote
        self.users_restaurants.where(bottomless: true).count
    end

    def bottomless_downvote
        self.users_restaurants.where(bottomless: false).count
    end

    def drag_upvote
        self.users_restaurants.where(drag_brunch: true).count
    end

    def drag_downvote
        self.users_restaurants.where(drag_brunch: false).count
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
