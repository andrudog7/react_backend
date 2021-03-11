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
    :bottomless_upvote, 
    :bottomless_downvote,
    :reservations_upvote, 
    :reservations_downvote,
    :drink_specials_upvote, 
    :drink_specials_downvote,
    :outdoor_seating_upvote, 
    :outdoor_seating_downvote

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

end
