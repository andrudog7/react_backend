class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :users_restaurants
  
  def users_restaurants
    self.object.users_restaurants.map do |res|
      {id: res.restaurant_id,
      yelp_id: res.restaurant.yelp_id,
      name: res.restaurant.name,
      address1: res.restaurant.address1,
      city: res.restaurant.city,
      state: res.restaurant.state,
      zip_code: res.restaurant.zip_code,
      price: res.restaurant.price,
      rating: res.restaurant.rating,
      image_url: res.restaurant.image_url,
      url: res.restaurant.url,
      bottomless_upvote: res.restaurant.bottomless_upvote,
      bottomless_downvote: res.restaurant.bottomless_downvote,
      bottomless_price: res.bottomless_price,
      time_limit: res.time_limit,
      drink_specials_upvote: res.restaurant.drink_specials_upvote,
      drink_specials_downvote: res.restaurant.drink_specials_downvote,
      reservations_upvote: res.restaurant.reservations_upvote,
      reservations_downvote: res.restaurant.reservations_downvote,
      outdoor_seating_upvote: res.restaurant.outdoor_seating_upvote,
      outdoor_seating_downvote: res.restaurant.outdoor_seating_downvote,
      top_four: res.top_four,
      attribute1: res.attribute1,
      attribute2: res.attribute2,
      attribute3: res.attribute3
      } 
      end
  end

end
