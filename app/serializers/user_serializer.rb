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
      bottomless: res.bottomless} 
      end
  end

end
