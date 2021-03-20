class CommentsController < ApplicationController

    def create 
        @comment = Comment.create(comment_params)
        @restaurant = @comment.restaurant
        render json: @restaurant
    end

    private

    def comment_params
        params.require(:comment).permit(:restaurant_id, :user_id, :text)
    end
end
