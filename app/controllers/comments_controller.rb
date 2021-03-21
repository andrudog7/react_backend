class CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index 
        restaurant = Restaurant.find(params[:restaurant_id])
        comments = restaurant.comments
        comments.sort{|a, b|b.created_at <=> a.created_at} 
        render json: comments
    end

    def create 
        @comment = Comment.create(comment_params)
        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:restaurant_id, :user_id, :text)
    end
end
