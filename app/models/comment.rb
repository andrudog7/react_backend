class Comment < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user 
    has_many :votes
end
