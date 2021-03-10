class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :yelp_id, :name, :address1, :city, :state, :zip_code, :price, :rating, :image_url, :url
  has_many :comments

  def comments 
    self.object.comments.map do |comment|
      {text: comment.text,
      username: comment.user.username,
      created_at: comment.created_at}
      end
  end
end
