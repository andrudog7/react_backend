class Comment < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user 
    has_many :votes

    def username 
        self.user.username
    end

    def upvote(user)
        Vote.create(up: true, comment_id: self.id, user_id: user.id)
    end

    def upVotes
        self.votes.where(up: true).count
    end

    def downVotes 
        self.votes.where(up: false).count
    end
end
