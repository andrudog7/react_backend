class Restaurant < ApplicationRecord
    has_many :users_restaurants
    has_many :users, through: :users_restaurants
    has_many :comments 

    def self.get_restaurants_from_yelp(location)
        i = 50
        res = YelpSearch.new(location, i)
        total = res.results["total"]
        businesses = res.results["businesses"]
        searched = []
        businesses.each{|business| searched << create_from_yelp_data(business)}
        while i < (total > 1000 ? 949 : total)
            i += 50
            more = YelpSearch.new(location, i).results["businesses"]
            more.each{|business| searched << create_from_yelp_data(business)}
        end
        searched
    end

    def self.create_from_yelp_data(business)
        if (Restaurant.find_by(yelp_id: business["id"]))
            Restaurant.find_by(yelp_id: business["id"])
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
