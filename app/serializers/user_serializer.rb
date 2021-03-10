class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :restaurants 
  
  def restaurants
    self.object.restaurants.map do |res|
      {name: res.name, 
       city: res.city,
       state: res.state,
      id: res.id}
    end 
  end 
end
