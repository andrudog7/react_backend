class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, 
    :yelp_id, 
    :name, 
    :address1, 
    :city, 
    :state, 
    :zip_code, 
    :price, 
    :rating, 
    :image_url, 
    :url,
    :phone,
    :categories, 
    :bottomless_upvote, 
    :bottomless_downvote,
    :reservations_upvote, 
    :reservations_downvote,
    :drink_specials_upvote, 
    :drink_specials_downvote,
    :outdoor_seating_upvote, 
    :outdoor_seating_downvote,
    :drag_downvote,
    :drag_upvote

  has_many :comments
  
  def comments 
    self.object.comments.map do |comment|
      {text: comment.text,
      username: comment.user.username,
      created_at: comment.created_at,
      upVotes: comment.upVotes,
      downVotes: comment.downVotes
    }
      end
  end

  # def users_restaurants
  #   self.object.users_restaurants.map do |res|
  #     {id: res.id,
  #     yelp_id: res.restaurant.yelp_id,
  #     name: res.restaurant.name,
  #     bottomless_price: res.bottomless_price,
  #     time_limit: res.time_limit,
  #     top_four: res.top_four,
  #     attribute1: res.attribute1,
  #     attribute2: res.attribute2,
  #     attribute3: res.attribute3,
  #     bottomless: res.bottomless,
  #     outdoor_seating: res.outdoor_seating,
  #     reservations: res.reservations,
  #     drink_specials: res.drink_specials,
  #     restaurant_id: res.restaurant_id,
  #     user_id: res.user_id
  #     } 
  #     end
  # end

end
