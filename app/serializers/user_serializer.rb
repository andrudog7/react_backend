class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :users_restaurants
  has_many :restaurants, through: :users_restaurants 

  def users_restaurants
    self.object.users_restaurants.map do |res|
      {name: res.restaurant.name,
      city: res.restaurant.city,
      state: res.restaurant.state,
      id: res.restaurant_id,
      bottomless: res.bottomless,
      bottomless_price: res.bottomless_price,
      time_limit: res.time_limit,
      top_four: res.top_four,
      outdoor_seating: res.outdoor_seating,
      reservations: res.reservations,
      attribute1: res.attribute1,
      attribute2: res.attribute2,
      attribute3: res.attribute3,
      } 
      end
  end

end
