class Comment < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user 
    has_many :votes

    def upvote(user)
        Vote.create(up: true, comment_id: self.id, user_id: user.id)
    end
end
