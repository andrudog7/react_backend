class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :city, :my_image, :my_restaurants
  has_many :users_restaurants

  def users_restaurants
    self.object.users_restaurants.map do |res|
      {id: res.id,
      yelp_id: res.restaurant.yelp_id,
      name: res.restaurant.name,
      bottomless_price: res.bottomless_price,
      time_limit: res.time_limit,
      top_four: res.top_four,
      attribute1: res.attribute1,
      attribute2: res.attribute2,
      attribute3: res.attribute3,
      bottomless: res.bottomless,
      outdoor_seating: res.outdoor_seating,
      reservations: res.reservations,
      drink_specials: res.drink_specials,
      drag_brunch: res.drag_brunch,
      restaurant_id: res.restaurant_id,
      user_id: res.user_id
      } 
      end
  end

end
