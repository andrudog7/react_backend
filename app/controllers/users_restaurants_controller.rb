class UsersRestaurantsController < ApplicationController

    def create 
        relationship = UsersRestaurant.find_or_create_by(users_restaurants_params)
        relationship.my_profile = true 
        relationship.save
        @restaurant = Restaurant.find(relationship.restaurant_id)
        render json: @restaurant
    end

    def update 
        if params[:users_restaurants][:my_profile]
            @relationship = UsersRestaurant.find(params[:id])
            @relationship.update(:my_profile => users_restaurants_params[:my_profile])
            render json: @relationship
        end
    end

    private

    def users_restaurants_params
        params.require(:users_restaurants).permit(:restaurant_id, :user_id, :my_profile)
    end
end
